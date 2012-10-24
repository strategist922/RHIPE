#include "org_godhuli_rhipe_bridge_REngineCore.h"
#include "global.h"
#include <stdio.h>
extern int   R_running_as_main_program ;
JNIContainer *jniContainer;

int initialize
(int argc, char **argv) 
{
  structRstart rp;
  Rstart Rp = &rp;
  if (!getenv("R_HOME")) {
    return(-1);
  }
  R_running_as_main_program = 0;
  R_DefParams(Rp);
  Rp->NoRenviron = 0;
  Rp->R_Interactive = (Rboolean)1;
  R_SetParams(Rp);
  R_SignalHandlers=0;
  R_CStackLimit = (uintptr_t)-1;
  int stat= Rf_initialize_R(argc, argv);
  if (stat<0) {
    return(-(1000+stat));
  }
  R_SignalHandlers=0;
  R_CStackLimit = (uintptr_t)-1;
  R_Outputfile = NULL;
  R_Consolefile = NULL;
  R_Interactive = (Rboolean)0;
  ptr_R_ShowMessage = Re_ShowMessage;
  ptr_R_WriteConsoleEx =Re_WriteConsoleEx;
  ptr_R_WriteConsole = NULL;
  ptr_R_ReadConsole = NULL;
  return(0);
}


JNIEXPORT jint JNICALL Java_org_godhuli_rhipe_bridge_REngineCore_intializeR
(JNIEnv *env, jobject obj, jobjectArray a)
{
  jniContainer = (JNIContainer* ) malloc(sizeof(JNIContainer));
  if(jniContainer == 0)
    return(-1);

  jniContainer->enObj	= env->NewGlobalRef( obj );
  if(jniContainer->enObj == NULL)
    return(-2);
  jniContainer->enClass	= (jclass)env->NewGlobalRef(env->GetObjectClass(jniContainer->enObj));
  if(jniContainer->enClass == NULL)
    return(-3);
  jniContainer->enEnv	= env;
  
  int argc	= (int)(env->GetArrayLength(a));
  char ** argv	= (char**) malloc(sizeof(char*)*(argc+1));
  for(int i=0; i < argc-1;i++){
    jstring o=(jstring)(env->GetObjectArrayElement(a, i));
    const char *c=env->GetStringUTFChars(o, 0);
    argv[i] = strdup(c);
    env->ReleaseStringUTFChars(o, c);
  }
  argv[argc]=0;
  int initRes=initialize(argc, argv);
  return initRes;
}


int main(int argc, char *argv[]){
  printf("Hello Sweet World\n");
  return(1);
}
  
