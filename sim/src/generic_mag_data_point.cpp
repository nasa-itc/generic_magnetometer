#include <ItcLogger/Logger.hpp>
#include <generic_mag_data_point.hpp>

namespace Nos3
{
    extern ItcLogger::Logger *sim_logger;

    Generic_magDataPoint::Generic_magDataPoint(double count)
    {
        sim_logger->trace("Generic_magDataPoint::Generic_magDataPoint:  Defined Constructor executed");

        /* Do calculations based on provided data */
        std::vector<bool> valid(3, true);
        std::vector<float> axes(3, 0.0);
        _generic_mag_data = axes;
        _generic_mag_data[0] = count * 0.001;
        _generic_mag_data[1] = count * 0.001;
        _generic_mag_data[2] = count * 0.001;
    }

    Generic_magDataPoint::Generic_magDataPoint(int16_t spacecraft, const boost::shared_ptr<Sim42DataPoint> dp)
    {
        sim_logger->trace("Generic_magDataPoint::Generic_magDataPoint:  42 Constructor executed");

        /* Initialize data */
        std::vector<bool> valid(3, false);
        std::vector<float> axes(3, 0.0);
        _generic_mag_data = axes;
        _generic_mag_data[0] = 0.0;
        _generic_mag_data[1] = 0.0;
        _generic_mag_data[2] = 0.0;

        /*
        ** Declare 42 telemetry string prefix
        ** 42 variables defined in `42/Include/42types.h`
        ** 42 data stream defined in `42/Source/IPC/SimWriteToSocket.c`
        */
        std::ostringstream MatchString;
        MatchString << "SC[" << spacecraft << "].AC.MAG";
        size_t MSsize = MatchString.str().size();

        /* Parse 42 telemetry */
        std::vector<std::string> lines = dp->get_lines();
        try 
        {
            for (int i = 0; i < lines.size(); i++) 
            {
                // Debugging print
                sim_logger->debug("Line[%d] = %s", i, lines[i].c_str());

                // Compare prefix
                if (lines[i].compare(0, MSsize, MatchString.str()) == 0) 
                {
                    size_t lb = lines[i].find_first_of("[", MSsize);
                    size_t rb = lines[i].find_first_of("]", MSsize);
                    int index = std::stoi(lines[i].substr(lb+1, rb-lb-1));
                    if ((index >= 0) && (index < numAxes)) {
                        std::string param(lines[i].substr(rb+2, 5));
                        size_t equal = lines[i].find_first_of("=");
                        std::string value(lines[i].substr(equal+1, lines[i].size()-equal-1));
                        if (param.compare("Valid") == 0) 
                        {
                            int flag = std::stoi(value);
                            if (flag != 0) 
                            {
                                valid[index] = true;
                            } else 
                            {
                                valid[index] = false;
                                _generic_mag_data[index] = 0.0;
                            }
                        } else if (param.compare("Field") == 0) 
                        {
                            _generic_mag_data[index] = std::stof(value);
                            // Debugging print
                            sim_logger->debug("  mag[%d] stof(value) = %f ", index, std::stof(value));
                        }
                    }
                }
            }
        } 
        catch(const std::exception& e) 
        {
            /* Force data to be set to known values */
            std::vector<float> axes(3, 5.0);
            _generic_mag_data = axes; 
            sim_logger->error("Generic_magDataPoint::Generic_magDataPoint:  Parsing exception %s", e.what());
        }
    }

    /* Used for printing a representation of the data point */
    std::string Generic_magDataPoint::to_string(void) const
    {
        sim_logger->trace("Generic_magDataPoint::to_string:  Executed");
        std::stringstream output;
        output << "Channel values: ";
        int i;
        for (i = 0; i < _generic_mag_data.size(); i++) {
            output << _generic_mag_data[i];
            if (i < _generic_mag_data.size() - 1) {
                output << ", ";
            }
        }
        return output.str();
    }
} /* namespace Nos3 */
