/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * getLinear_initialize.c
 *
 * Code generation for function 'getLinear_initialize'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "getLinear.h"
#include "getLinear_initialize.h"

/* Function Definitions */
void getLinear_initialize(void)
{
  rt_InitInfAndNaN(8U);
  getLinear_init();
}

/* End of code generation (getLinear_initialize.c) */
