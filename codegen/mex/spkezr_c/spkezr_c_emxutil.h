/*
 * Student License - for use by students to meet course requirements and
 * perform academic research at degree granting institutions only.  Not
 * for government, commercial, or other organizational use.
 *
 * spkezr_c_emxutil.h
 *
 * Code generation for function 'spkezr_c_emxutil'
 *
 */

#pragma once

/* Include files */
#include "rtwtypes.h"
#include "spkezr_c_types.h"
#include "emlrt.h"
#include "mex.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function Declarations */
void emxEnsureCapacity_char_T(const emlrtStack *sp, emxArray_char_T *emxArray,
                              int32_T oldNumel,
                              const emlrtRTEInfo *srcLocation);

void emxFree_char_T(const emlrtStack *sp, emxArray_char_T **pEmxArray);

void emxInit_char_T(const emlrtStack *sp, emxArray_char_T **pEmxArray,
                    const emlrtRTEInfo *srcLocation);

/* End of code generation (spkezr_c_emxutil.h) */
