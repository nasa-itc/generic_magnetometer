#ifndef _GENERIC_mag_CHECKOUT_DEVICE_CFG_H_
#define _GENERIC_mag_CHECKOUT_DEVICE_CFG_H_

/*
** GENERIC_mag Checkout Configuration
*/
#define GENERIC_mag_CFG
/* Note: NOS3 uart requires matching handle and bus number */
#define GENERIC_mag_CFG_STRING           "/dev/usart_16"
#define GENERIC_mag_CFG_HANDLE           16 
#define GENERIC_mag_CFG_BAUDRATE_HZ      115200
#define GENERIC_mag_CFG_MS_TIMEOUT       250
#define GENERIC_mag_CFG_DEBUG

#endif /* _GENERIC_mag_CHECKOUT_DEVICE_CFG_H_ */
