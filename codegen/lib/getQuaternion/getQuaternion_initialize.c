/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * getQuaternion_initialize.c
 *
 * Code generation for function 'getQuaternion_initialize'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "getQuaternion.h"
#include "getQuaternion_initialize.h"

/* Function Definitions */
void getQuaternion_initialize(void)
{
  rt_InitInfAndNaN(8U);
  getQuaternion_init();
}

/* End of code generation (getQuaternion_initialize.c) */
