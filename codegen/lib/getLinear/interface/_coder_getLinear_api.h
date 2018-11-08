/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_getLinear_api.h
 *
 * Code generation for function '_coder_getLinear_api'
 *
 */

#ifndef _CODER_GETLINEAR_API_H
#define _CODER_GETLINEAR_API_H

/* Include files */
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include <stddef.h>
#include <stdlib.h>
#include "_coder_getLinear_api.h"

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern void getLinear(real_T q[4], real_T accel_x, real_T accel_y, real_T
                      accel_z, real_T dt, real_T position[3], real_T velocity[3]);
extern void getLinear_api(const mxArray * const prhs[5], const mxArray *plhs[2]);
extern void getLinear_atexit(void);
extern void getLinear_initialize(void);
extern void getLinear_terminate(void);
extern void getLinear_xil_terminate(void);

#endif

/* End of code generation (_coder_getLinear_api.h) */
