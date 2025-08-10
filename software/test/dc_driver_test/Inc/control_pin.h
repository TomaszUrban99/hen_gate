#ifndef CONTROL_PIN_H
#define CONTROL_PIN_H

#include "stm32f407xx.h"
#include "ctype.h"

struct control_pin {

	GPIO_TypeDef *_port;
	uint8_t _pin;

};

/*!
 * \brief Initialize control_pin structure
 */
void control_pin_init(struct control_pin *self, GPIO_TypeDef *port, uint8_t pin);

/*
 * \brief Set control pin to high
 */
void control_pin_high(struct control_pin *self);

/*!
 * \brief Set control pin to low
 */
void control_pin_low(struct control_pin *self);

#endif
