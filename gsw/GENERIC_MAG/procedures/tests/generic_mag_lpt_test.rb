require 'cosmos'
require 'cosmos/script'
require "cfs_lib.rb"
#require 'math'

# ##
# ## NOOP
# ##
# initial_command_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_COUNT")
# initial_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT")
# initial_device_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT")
# cmd("GENERIC_MAG GENERIC_MAG_NOOP_CC")
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_COUNT > #{initial_command_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT == #{initial_error_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT == #{initial_device_error_count}", 30)

# sleep(5)

# ##
# ## Successful Disable
# ##
# initial_command_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_COUNT")
# initial_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT")
# initial_device_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT")
# cmd("GENERIC_MAG GENERIC_MAG_DISABLE_CC")
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_COUNT > #{initial_command_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT == #{initial_error_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT == #{initial_device_error_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ENABLED == 'DISABLED'", 30)

# sleep(5)

# ##
# ## Failed Disable (doubled)
# ##
# initial_command_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_COUNT")
# initial_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT")
# initial_device_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT")
# cmd("GENERIC_MAG GENERIC_MAG_DISABLE_CC")
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_COUNT > #{initial_command_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT == #{initial_error_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT > #{initial_device_error_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ENABLED == 'DISABLED'", 30)

# sleep(5)

# ##
# ## HK without Device
# ##
# initial_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT")
# initial_device_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT")
# cmd("GENERIC_MAG GENERIC_MAG_REQ_HK")
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT == #{initial_error_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT == #{initial_device_error_count}", 30)

# sleep(5)

# ##
# ## Data without Device
# ##
# initial_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT")
# initial_device_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT")
# cmd("GENERIC_MAG GENERIC_MAG_REQ_DATA")
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT == #{initial_error_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT == #{initial_device_error_count}", 30)

# sleep(5)

# ##
# ## Successful Enable
# ##
# initial_command_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_COUNT")
# initial_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT")
# initial_device_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT")
# cmd("GENERIC_MAG GENERIC_MAG_ENABLE_CC")
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_COUNT > #{initial_command_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT == #{initial_error_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT == #{initial_device_error_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ENABLED == 'ENABLED'", 30)

# sleep(5)

# ##
# ## Failed Enable (doubled)
# ##
# initial_command_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_COUNT")
# initial_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT")
# initial_device_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT")
# cmd("GENERIC_MAG GENERIC_MAG_ENABLE_CC")
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_COUNT > #{initial_command_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT == #{initial_error_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT > #{initial_device_error_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ENABLED == 'ENABLED'", 30)

# sleep(5)

# ##
# ## Housekeeping w/ Device
# ##
# initial_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT")
# initial_device_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT")
# cmd("GENERIC_MAG GENERIC_MAG_REQ_HK")
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT == #{initial_error_count}", 30)
# wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT == #{initial_device_error_count}", 30)

# sleep(5)


##
## Data w/ Device
##
initial_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT")
initial_device_error_count = tlm("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT")

cmd("GENERIC_MAG GENERIC_MAG_REQ_DATA")

diff = 500

wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT == #{initial_error_count}", 30)
wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT == #{initial_device_error_count}", 30)

truth_42_bvb0 = tlm("SIM_42_TRUTH SIM_42_TRUTH_DATA BVB_0")
bvb_adjusted_0 = truth_42_bvb0*1000000000
wait_check_tolerance("GENERIC_MAG GENERIC_MAG_DATA_TLM RAW_MAG_X",bvb_adjusted_0, diff, 15)

truth_42_bvb1 = tlm("SIM_42_TRUTH SIM_42_TRUTH_DATA BVB_1")
bvb_adjusted_1 = truth_42_bvb0*1000000000
wait_check_tolerance("GENERIC_MAG GENERIC_MAG_DATA_TLM RAW_MAG_Y",bvb_adjusted_1, diff, 15)

truth_42_bvb2 = tlm("SIM_42_TRUTH SIM_42_TRUTH_DATA BVB_2")
bvb_adjusted_2 = truth_42_bvb2*1000000000
wait_check_tolerance("GENERIC_MAG GENERIC_MAG_DATA_TLM RAW_MAG_Z",bvb_adjusted_2, diff, 15)



sleep(5)

##
## Reset Counters
##
cmd("GENERIC_MAG GENERIC_MAG_DISABLE_CC") # disable to be able to properly check that device count gets reset
cmd("GENERIC_MAG GENERIC_MAG_RST_COUNTERS_CC")
wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_COUNT == 0", 30)
wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM CMD_ERR_COUNT == 0", 30)
wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_COUNT == 0", 30)
wait_check("GENERIC_MAG GENERIC_MAG_HK_TLM DEVICE_ERR_COUNT == 0", 30)

##
## Reenable so test can be run multiple times
##
cmd("GENERIC_MAG GENERIC_MAG_ENABLE_CC")