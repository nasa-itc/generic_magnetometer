require 'cosmos'
require 'cosmos/script'
require "generic_mag_lib.rb"

##
## This script tests the cFS component in an automated scenario.
## Currently this includes: 
##   Hardware failure
##   Hardware status reporting fault
##


##
## Hardware failure
##
GENERIC_MAG_TEST_LOOP_COUNT.times do |n|
    # Prepare
    generic_mag_prepare_ast()

    # Disable sim and confirm device error counts increase
    dev_cmd_cnt = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_COUNT")
    dev_cmd_err_cnt = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT")
    generic_mag_sim_disable()
    check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_COUNT == #{dev_cmd_cnt}")
    check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT >= #{dev_cmd_err_cnt}")

    # Enable sim and confirm return to nominal operation
    generic_mag_sim_enable()
    confirm_generic_mag_data_loop()
end


##
## Hardware status reporting fault
##
GENERIC_MAG_TEST_LOOP_COUNT.times do |n|
    # Prepare
    generic_mag_prepare_ast()

    # Add a fault to status in the simulator
    generic_mag_sim_set_status(255)

    # Confirm that status register and that app disabled itself
    get_generic_mag_hk()
    #check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_STATUS == 255")
    get_generic_mag_hk()
    #check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ENABLED == 'DISABLED'")
    
    # Clear simulator status fault
    generic_mag_sim_set_status(0)
end
