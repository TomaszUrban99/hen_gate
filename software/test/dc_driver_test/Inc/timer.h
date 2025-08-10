#ifndef TIMER_H_
#define TIMER_H_

#include <ctype.h>

#include "stm32f407xx.h"
#include "clock.h"

#define SYSTICK_CORE_CLOCK SystemCoreClock

/*!
 * 	Delay timer structure
 *
 * 	_timer_started - if 1 SysTick enabled and waiting for interrupt, if 0 SysTick disabled
 * 	_waiting_flag - if _timer_started equals to 1, then if _waiting_flag = 0 exception has not occured yet,
 * 	if _waiting flag = 1 exception has already occured
 *
 */
struct timer {

	uint8_t	_timer_started;
	uint8_t _waiting_flag;
};

/*!
 * \brief Delay function with exception
 */
void delay_exception_init(struct timer *self, uint32_t delay_ms);

/*!
 *	\brief Disable exception delay
 */
void delay_exception_disable(struct timer *self);

/*!
 * 	\brief Delay function
 */
void delay(uint32_t delay_ms);


#endif /* TIMER_H_ */
