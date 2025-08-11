#include "clock.h"

void clock_init (void){

	/* Enable HSE */
	RCC->CR |= RCC_CR_HSEON;

	/* Wait until HSE is ready */
	while (!(RCC->CR & RCC_CR_HSERDY));

	/* Set HSE as system clock */
	RCC->CFGR |= RCC_CFGR_SW_0;
	RCC->CFGR &= ~RCC_CFGR_SW_1;

	/* Wait until HSE is used as system clock */
	while(!(RCC->CFGR & RCC_CFGR_SWS_0));

	SystemCoreClockUpdate();
}

