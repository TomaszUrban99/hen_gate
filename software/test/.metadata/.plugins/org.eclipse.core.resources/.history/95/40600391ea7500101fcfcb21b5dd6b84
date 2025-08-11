#include "pwm.h"

void pwm_init(uint8_t duty_cycle, uint32_t frequency){

	/* Enable PWM */
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN;

	/* Configure GPIOD port number as general purpose output */
	GPIOD->MODER &= ~GPIO_MODER_MODER12_Msk;
	GPIOD->MODER |=  GPIO_MODER_MODER12_1;

	/* Set TIMER on PD12 */
	GPIOD->AFR[1] |= GPIO_AFRH_AFSEL12_1;

	/* Enable clock access to TIM4 */
	RCC->APB1ENR |= RCC_APB1ENR_TIM4EN;

	/* Timer & PWM parameters */
	TIM4->PSC = TIMER_PSC - 1;
	TIM4->ARR = frequency;
	TIM4->CCR1 = ((TIM4->ARR * duty_cycle) / 100 & 0xFFFF);

	/* PWM mode for channel */
	TIM4->CCMR1 &= ~TIM_CCMR1_OC1M_Msk;
	TIM4->CCMR1 |= TIM_CCMR1_OC1M_1;
	TIM4->CCMR1 |= TIM_CCMR1_OC1M_2;

	/* Auto Reload ARPE TIMx_CR1 */
	TIM4->CR1 |= TIM_CR1_ARPE;

	/* OCx output enable CCxE in TIMx_CCER */
	TIM4->CCER |= TIM_CCER_CC1E;
}

void pwm_set_duty_cycle(uint8_t duty_cycle){

	TIM4->CCR1 = ((TIM4->ARR * duty_cycle) / 100 & 0xFFFF);
}

void pwm_enable(){
	/* Timer 4 - enable PWM */
	TIM4->CR1 |= TIM_CR1_CEN;
}

void pwm_disable(){
	/* Timer 4 - disable PWM */
	TIM4->CR1 &= ~TIM_CR1_CEN;

	GPIOD->ODR &= ~GPIO_ODR_OD12;
}
