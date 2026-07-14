import sys
import glob
import time

for p in glob.glob('/gems/gems/openc3-cosmos-nos3-*/targets/GENERIC_MAG/scripts'):
    if p not in sys.path:
        sys.path.append(p)

from openc3.script import cmd, tlm, check, wait_check

try:
    from nos3.generic_mag_lib import *
except ImportError:
    pass

def run_generic_mag_ast_test():
    ##
    ## This script tests the cFS component in an automated scenario.
    ## Currently this includes: 
    ##   Hardware failure
    ##   Hardware status reporting fault
    ##


    ##
    ## Hardware failure
    ##
    for n in range(GENERIC_MAG_TEST_LOOP_COUNT):
        # Prepare
        generic_mag_prepare_ast()

        # Disable sim and confirm device error counts increase
        dev_cmd_cnt = tlm("GENERIC_MAG_DEBUG GENERIC_MAG_HK_TLM DEVICE_COUNT")
        dev_cmd_err_cnt = tlm("GENERIC_MAG_DEBUG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT")
        generic_mag_sim_disable()
        time.sleep(1)

        cmd("GENERIC_MAG_DEBUG GENERIC_MAG_REQ_DATA")
        time.sleep(1)

        get_generic_mag_hk()

        wait_check(f"GENERIC_MAG_DEBUG GENERIC_MAG_HK_TLM DEVICE_COUNT >= {dev_cmd_cnt}", 5)
        wait_check(f"GENERIC_MAG_DEBUG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT > {dev_cmd_err_cnt}", 5)

        # Enable sim and confirm return to nominal operation
        generic_mag_sim_enable()
        confirm_generic_mag_data_loop()