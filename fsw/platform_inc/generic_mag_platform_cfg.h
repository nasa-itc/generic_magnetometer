/************************************************************************
** File:
**   $Id: generic_mag_platform_cfg.h  $
**
** Purpose:
**  Define generic_mag Platform Configuration Parameters
**
** Notes:
**
*************************************************************************/
#ifndef _GENERIC_MAG_PLATFORM_CFG_H_
#define _GENERIC_MAG_PLATFORM_CFG_H_

/*
** Default GENERIC_MAG Configuration
*/
#ifndef GENERIC_MAG_CFG
    /* Notes: 
    **   NOS3 uart requires matching handle and bus number
    */
    #define GENERIC_MAG_CFG_STRING           "usart_7"
    #define GENERIC_MAG_CFG_HANDLE           7
    #define GENERIC_MAG_CFG_BAUDRATE_HZ      115200
    #define GENERIC_MAG_CFG_MS_TIMEOUT       50            /* Max 255 */
    /* Note: Debug flag disabled (commented out) by default */
    //#define GENERIC_MAG_CFG_DEBUG
#endif

#endif /* _GENERIC_MAG_PLATFORM_CFG_H_ */
