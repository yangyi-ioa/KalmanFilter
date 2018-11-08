/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * quatmultiply.c
 *
 * Code generation for function 'quatmultiply'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "getLinear.h"
#include "quatmultiply.h"

/* Function Definitions */
void quatmultiply(const double q[4], const double r[4], double qout[4])
{
  qout[0] = ((q[0] * r[0] - q[1] * r[1]) - q[2] * r[2]) - q[3] * r[3];
  qout[1] = (q[0] * r[1] + r[0] * q[1]) + (q[2] * r[3] - q[3] * r[2]);
  qout[2] = (q[0] * r[2] + r[0] * q[2]) + (q[3] * r[1] - q[1] * r[3]);
  qout[3] = (q[0] * r[3] + r[0] * q[3]) + (q[1] * r[2] - q[2] * r[1]);
}

/* End of code generation (quatmultiply.c) */
