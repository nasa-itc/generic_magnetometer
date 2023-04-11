/*******************************************************************************
** File: generic_mag_device.c
**
** Purpose:
**   This file contains the source code for the GENERIC_MAG device.
**
*******************************************************************************/

/*
** Include Files
*/
#include "generic_mag_device.h"

/*
** Request data command
*/
int32_t GENERIC_MAG_RequestData(spi_info_t *device, GENERIC_MAG_Device_Data_tlm_t* data)
{
    int32_t status = OS_ERROR;
    uint8_t read_data[GENERIC_MAG_DEVICE_DATA_SIZE];
    uint8_t write_data[GENERIC_MAG_DEVICE_DATA_SIZE];
    uint32_t mag_x_tmp;
    uint32_t mag_y_tmp;
    uint32_t mag_z_tmp;

    /* Read data */
    if ((spi_select_chip(device) == SPI_SUCCESS) &&
        (spi_transaction(device, write_data, read_data, sizeof(read_data), GENERIC_MAG_CFG_DELAY, GENERIC_MAG_CFG_BITS_PER_WORD, 0) == SPI_SUCCESS) &&
        (spi_unselect_chip(device) == SPI_SUCCESS)) {
        status = OS_SUCCESS;
    }

    if (status == OS_SUCCESS)
    {
        #ifdef GENERIC_MAG_CFG_DEBUG
            OS_printf("  GENERIC_MAG_RequestData = 0x");
            for (uint32_t i = 0; i < sizeof(read_data); i++)
            {
                OS_printf("%02x, ", read_data[i]);
            }
            OS_printf("\n");
        #endif
        if ((read_data[0]  == GENERIC_MAG_DEVICE_HDR_0) && 
            (read_data[1]  == GENERIC_MAG_DEVICE_HDR_1) && 
            (read_data[2]  == GENERIC_MAG_DEVICE_HDR_2) && 
            (read_data[3]  == GENERIC_MAG_DEVICE_HDR_3))
        {
            data->MagneticIntensityX = (read_data[4] << 24) | (read_data[5] << 16) | (read_data[6] << 8) | (read_data[7]);
            data->MagneticIntensityY = (read_data[8] << 24) | (read_data[9] << 16) | (read_data[10] << 8) | (read_data[11]);
            data->MagneticIntensityZ = (read_data[12] << 24) | (read_data[13] << 16) | (read_data[14] << 8) | (read_data[15]);
            
            //mag_x_tmp = (read_data[4] << 24) | (read_data[5] << 16) | (read_data[6] << 8) | (read_data[7]);
            //mag_y_tmp = (read_data[8] << 24) | (read_data[9] << 16) | (read_data[10] << 8) | (read_data[11]);
            //mag_z_tmp = (read_data[12] << 24) | (read_data[13] << 16) | (read_data[14] << 8) | (read_data[15]);

            //data->MagneticIntensityX = ((mag_x_tmp - (MAG_CONV_CONST*MAG_RANGE)) / MAG_CONV_CONST);
            //data->MagneticIntensityY = ((mag_y_tmp - (MAG_CONV_CONST*MAG_RANGE)) / MAG_CONV_CONST);
            //data->MagneticIntensityZ = ((mag_z_tmp - (MAG_CONV_CONST*MAG_RANGE)) / MAG_CONV_CONST);

            #ifdef GENERIC_MAG_CFG_DEBUG
                OS_printf("  Magnetic Field Intensity X = 0x%08x, %d\n", data->MagneticIntensityX, data->MagneticIntensityX);
                OS_printf("  Magnetic Field Intensity Y = 0x%08x, %d\n", data->MagneticIntensityY, data->MagneticIntensityY);
                OS_printf("  Magnetic Field Intensity Z = 0x%08x, %d\n", data->MagneticIntensityZ, data->MagneticIntensityZ);
            #endif
        }
    } 
    else
    {
        #ifdef GENERIC_MAG_CFG_DEBUG
            OS_printf("  GENERIC_MAG_RequestData: Invalid data read! \n");
        #endif 
        status = OS_ERROR;
    }
    return status;
}