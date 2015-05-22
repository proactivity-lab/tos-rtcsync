/**
 * @author Raido Pahtma
 * @license MIT
 */
#ifndef REALTIMECLOCKSYNC_H_
#define REALTIMECLOCKSYNC_H_

#include "time64.h"

#ifndef AMID_RTC
	#define AMID_RTC 0x80
#endif // AMID_RTC

enum Headers {
	TIME_ANNOUNCEMENT_UNIX = 1,
};

typedef nx_struct RTCSync_t {
	nx_uint8_t header; // 1 - time announcement
	nx_uint8_t stratum; // Like NTP stratum
	nx_time64_t nxtime; // Unix time, Big-endian
} RTCSync_t;

#endif // REALTIMECLOCKSYNC_H_

