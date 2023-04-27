/*******************************************************************************
** File:
**   generic_mag_msg.h
**
** Purpose:
**  Define GENERIC_MAG application commands and telemetry messages
**
*******************************************************************************/
#ifndef _GENERIC_MAG_MSG_H_
#define _GENERIC_MAG_MSG_H_

#include "cfe.h"
#include "generic_mag_device.h"


/*
** Ground Command Codes
*/
#define GENERIC_MAG_NOOP_CC                 0
#define GENERIC_MAG_RESET_COUNTERS_CC       1
#define GENERIC_MAG_ENABLE_CC               2
#define GENERIC_MAG_DISABLE_CC              3


/* 
** Telemetry Request Command Codes
*/
#define GENERIC_MAG_REQ_HK_TLM              0
#define GENERIC_MAG_REQ_DATA_TLM            1


/*
** Generic "no arguments" command type definition
*/
typedef struct
{
    /* Every command requires a header used to identify it */
    uint8    CmdHeader[CFE_SB_CMD_HDR_SIZE];

} GENERIC_MAG_NoArgs_cmd_t;


/*
** GENERIC_MAG device telemetry definition
*/
typedef struct 
{
    uint8   TlmHeader[CFE_SB_TLM_HDR_SIZE];
    GENERIC_MAG_Device_Data_tlm_t Generic_mag;

} OS_PACK GENERIC_MAG_Device_tlm_t;
#define GENERIC_MAG_DEVICE_TLM_LNGTH sizeof ( GENERIC_MAG_Device_tlm_t )


/*
** GENERIC_MAG housekeeping type definition
*/
typedef struct 
{
    uint8   TlmHeader[CFE_SB_TLM_HDR_SIZE];
    uint8   CommandErrorCount;
    uint8   CommandCount;
    uint8   DeviceErrorCount;
    uint8   DeviceCount;
    uint8   DeviceEnabled;

} OS_PACK GENERIC_MAG_Hk_tlm_t;
#define GENERIC_MAG_HK_TLM_LNGTH sizeof ( GENERIC_MAG_Hk_tlm_t )

#endif /* _GENERIC_MAG_MSG_H_ */
