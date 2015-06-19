/**
 * RTC sync module, no transport delay compensation or anything - really basic.
 *
 * @author Raido Pahtma
 * @license MIT
 */
generic module RealTimeClockSyncP() {
	uses {
		interface RealTimeClock;
		interface Receive;
	}
}
implementation {

	#define __MODUUL__ "rtcsync"
	#define __LOG_LEVEL__ ( LOG_LEVEL_RealTimeClockSyncP & BASE_LOG_LEVEL )
	#include "log.h"

	event message_t* Receive.receive(message_t* msg, void* payload, uint8_t len) {
		if(len == sizeof(RTCSync_t)) {
			RTCSync_t* rt = (RTCSync_t*)payload;
			if(rt->header == TIME_ANNOUNCEMENT_UNIX) {
				time64_t t = rt->nxtime;
				info1("tsync %"PRIu32"->%"PRIu32, (uint32_t)call RealTimeClock.time(), (uint32_t)t);
				call RealTimeClock.stime(t);
			} else warn1("hdr %u", rt->header);
		} else warn1("len %u!=%u", len, sizeof(RTCSync_t));
		return msg;
	}

	async event void RealTimeClock.changed(time64_t old, time64_t current) { }

}
