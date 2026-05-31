// HidPacer.h — periodic FreeRTOS task that drains motion queue and sends USB HID.
// Runs on core 1 at HID_PACER_INTERVAL_MS so USB reports stay within host poll rate.

#pragma once

#include <Arduino.h>

void startHidPacerTask();
