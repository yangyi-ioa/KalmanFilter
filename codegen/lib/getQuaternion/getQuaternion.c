/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * getQuaternion.c
 *
 * Code generation for function 'getQuaternion'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "getQuaternion.h"

/* Variable Definitions */
static double q_last[4];

/* Function Definitions */
void getQuaternion(double w_x, double w_y, double w_z, double dt, double q[4])
{
  double qm;
  double scale;
  int k;
  double b_q;
  double absxk;
  double t;
  q[0] = ((q_last[0] * 0.0 - q_last[1] * w_x) - q_last[2] * w_y) - q_last[3] *
    w_z;
  q[1] = (q_last[0] * w_x + 0.0 * q_last[1]) + (q_last[2] * w_z - q_last[3] *
    w_y);
  q[2] = (q_last[0] * w_y + 0.0 * q_last[2]) + (q_last[3] * w_x - q_last[1] *
    w_z);
  q[3] = (q_last[0] * w_z + 0.0 * q_last[3]) + (q_last[1] * w_y - q_last[2] *
    w_x);
  qm = 0.0;
  scale = 3.3121686421112381E-170;
  for (k = 0; k < 4; k++) {
    b_q = q_last[k] + dt * (0.5 * q[k]);
    absxk = fabs(b_q);
    if (absxk > scale) {
      t = scale / absxk;
      qm = 1.0 + qm * t * t;
      scale = absxk;
    } else {
      t = absxk / scale;
      qm += t * t;
    }

    q[k] = b_q;
  }

  qm = scale * sqrt(qm);
  for (k = 0; k < 4; k++) {
    b_q = q[k] / qm;
    q_last[k] = b_q;
    q[k] = b_q;
  }
}

void getQuaternion_init(void)
{
  int i0;
  static const signed char iv0[4] = { 1, 0, 0, 0 };

  for (i0 = 0; i0 < 4; i0++) {
    q_last[i0] = iv0[i0];
  }
}

/* End of code generation (getQuaternion.c) */
