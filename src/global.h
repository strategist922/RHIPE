#ifndef __GLOBALS__H__
#define __GLOBALS__H__

#include <jni.h>

#define R_NO_REMAP
#define R_INTERFACE_PTRS 1
#define CSTACK_DEFNS 1 

#include <Rversion.h>
#include <R.h>
#include <Rdefines.h>
#include <Rinterface.h>
#include <Rembedded.h>
#include <R_ext/Boolean.h>
#include <R_ext/Parse.h>


struct JNIContainer {
  jobject enObj;
  jclass  enClass;
  JNIEnv  *enEnv;
};
extern JNIContainer *jniContainer;

void Re_ShowMessage(const char*);
void Re_WriteConsoleEx(const char *, int , int );
void Re_WriteConsole(const char *buf, int len);
void Re_ResetConsole();
void Re_FlushConsole();
void Re_ClearerrConsole();

#endif
