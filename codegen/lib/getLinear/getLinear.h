/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * getLinear.h
 *
 * Code generation for function 'getLinear'
 *
 */

#ifndef GETLINEAR_H
#define GETLINEAR_H

/* Include files */
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include "rtwtypes.h"
#include "getLinear_types.h"

/* Function Declarations */
extern void getLinear(const double q[4], double accel_x, double accel_y, double
                      accel_z, double dt, double position[3], double velocity[3]);
extern void getLinear_init(void);

#endif

/* End of code generation (getLinear.h) */
