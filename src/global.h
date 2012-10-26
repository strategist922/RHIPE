#ifndef __GLOBALS__H__
#define __GLOBALS__H__

#include <jni.h>
#include "Rincludes.h"


struct JNIContainer {
  jobject enObj;
  jclass  enClass;
  JNIEnv  *enEnv;
};
extern JNIContainer *jniContainer;

void Re_ShowMessage(const char*);
void Re_WriteConsoleEx(const char *, int , int );
/* void Re_WriteConsole(const char *buf, int len); */
/* void Re_ResetConsole(); */
/* void Re_FlushConsole(); */
/* void Re_ClearerrConsole(); */

#endif
