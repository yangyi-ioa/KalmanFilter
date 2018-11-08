/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * getLinear.c
 *
 * Code generation for function 'getLinear'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "getLinear.h"
#include "quatmultiply.h"

/* Variable Definitions */
static double velocity_last[3];
static double position_last[3];

/* Function Definitions */
void getLinear(const double q[4], double accel_x, double accel_y, double accel_z,
               double dt, double position[3], double velocity[3])
{
  int k;
  double b_q[4];
  double dv0[4];
  double dv1[4];
  double accel[4];
  double a;
  double b_velocity;
  static const double dv2[3] = { 0.0, 0.0, 9.8066 };

  double b_position;

  /*      accel = quatrotate(q,[accel_x, accel_y, accel_z]); */
  for (k = 0; k < 4; k++) {
    b_q[k] = q[k];
  }

  for (k = 0; k < 3; k++) {
    b_q[k + 1] = -b_q[k + 1];
  }

  dv0[0] = 0.0;
  dv0[1] = accel_x;
  dv0[2] = accel_y;
  dv0[3] = accel_z;
  quatmultiply(dv0, q, dv1);
  quatmultiply(b_q, dv1, accel);
  a = 0.5 * (dt * dt);
  for (k = 0; k < 3; k++) {
    b_velocity = velocity_last[k] + dt * (accel[1 + k] - dv2[k]);
    b_position = (position_last[k] + dt * velocity_last[k]) + a * (accel[1 + k]
      - dv2[k]);
    velocity_last[k] = b_velocity;
    position_last[k] = b_position;
    velocity[k] = b_velocity;
    position[k] = b_position;
  }
}

void getLinear_init(void)
{
  int i0;
  for (i0 = 0; i0 < 3; i0++) {
    velocity_last[i0] = 0.0;
    position_last[i0] = 0.0;
  }
}

/* End of code generation (getLinear.c) */
