/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_getQuaternion_mex.c
 *
 * Code generation for function '_coder_getQuaternion_mex'
 *
 */

/* Include files */
#include "_coder_getQuaternion_api.h"
#include "_coder_getQuaternion_mex.h"

/* Function Declarations */
static void getQuaternion_mexFunction(int32_T nlhs, mxArray *plhs[1], int32_T
  nrhs, const mxArray *prhs[4]);

/* Function Definitions */
static void getQuaternion_mexFunction(int32_T nlhs, mxArray *plhs[1], int32_T
  nrhs, const mxArray *prhs[4])
{
  const mxArray *inputs[4];
  const mxArray *outputs[1];
  int32_T b_nlhs;
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;

  /* Check for proper number of arguments. */
  if (nrhs != 4) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 4, 4,
                        13, "getQuaternion");
  }

  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 13,
                        "getQuaternion");
  }

  /* Temporary copy for mex inputs. */
  if (0 <= nrhs - 1) {
    memcpy((void *)&inputs[0], (void *)&prhs[0], (uint32_T)(nrhs * (int32_T)
            sizeof(const mxArray *)));
  }

  /* Call the function. */
  getQuaternion_api(inputs, outputs);

  /* Copy over outputs to the caller. */
  if (nlhs < 1) {
    b_nlhs = 1;
  } else {
    b_nlhs = nlhs;
  }

  emlrtReturnArrays(b_nlhs, plhs, outputs);

  /* Module termination. */
  getQuaternion_terminate();
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const mxArray
                 *prhs[])
{
  mexAtExit(getQuaternion_atexit);

  /* Initialize the memory manager. */
  /* Module initialization. */
  getQuaternion_initialize();

  /* Dispatch the entry-point. */
  getQuaternion_mexFunction(nlhs, plhs, nrhs, prhs);
}

emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_getQuaternion_mex.c) */
