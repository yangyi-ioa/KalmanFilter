/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_getQuaternion_api.h
 *
 * Code generation for function '_coder_getQuaternion_api'
 *
 */

#ifndef _CODER_GETQUATERNION_API_H
#define _CODER_GETQUATERNION_API_H

/* Include files */
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include <stddef.h>
#include <stdlib.h>
#include "_coder_getQuaternion_api.h"

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern void getQuaternion(real_T w_x, real_T w_y, real_T w_z, real_T dt, real_T
  q[4]);
extern void getQuaternion_api(const mxArray * const prhs[4], const mxArray *
  plhs[1]);
extern void getQuaternion_atexit(void);
extern void getQuaternion_initialize(void);
extern void getQuaternion_terminate(void);
extern void getQuaternion_xil_terminate(void);

#endif

/* End of code generation (_coder_getQuaternion_api.h) */
