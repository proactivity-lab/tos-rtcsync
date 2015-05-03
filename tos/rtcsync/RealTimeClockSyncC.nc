/**
 * RTC sync module, no transport delay compensation or anything - really basic.
 *
 * @author Raido Pahtma
 * @license MIT
 */
#include "RealTimeClockSync.h"
configuration RealTimeClockSyncC { }
implementation {

	components new RealTimeClockSyncP();

	components RealTimeClockC;
	RealTimeClockSyncP.RealTimeClock -> RealTimeClockC;

	components new AMReceiverC(AMID_RTC);
	RealTimeClockSyncP.Receive -> AMReceiverC;

}