# KalmanFilter

This repo contains the code for the development of a filter to process raw sensor data on a custom ARM-M4 based board for AIAA Northeastern's Project Karman

The filter must function accutately with infrequent GPS data (1 Hz GPS rate with gaps up to 60s). For this application an error-state Kalman filter was selected to correct the INS output when GPS is available in an attempt to minimize system drift.

This repo requires MatLab with the Aerospace Blockset. Eventually MatLab Coder will be used to generate c code to run on the embedded system.
