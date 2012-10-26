#include <stdio.h>
#include "org_godhuli_rhipe_bridge_REngineCore.h"
#include "global.h"
#include "misc.h"

JNIContainer *jniContainer;
int  Rf_initialize_R(int ac, char **av);
int initialize
(int argc, const char *s, char **argv) 
{
  structRstart rp;
  Rstart Rp = &rp;
  setenv("R_HOME", s,1);
  R_DefParams(Rp);
  Rp->NoRenviron = 0;
  R_SetParams(Rp);
  int stat=Rf_initialize_R(argc, argv);
  if (stat<0) {
    return(-(1000+stat));
  }
  R_SignalHandlers	= 0;
  R_CStackLimit		= (uintptr_t)-1;
  R_SignalHandlers	= 0;
  R_Outputfile		= NULL;
  R_Consolefile		= NULL;
  R_Interactive		= (Rboolean) 1;
  ptr_R_ShowMessage	= Re_ShowMessage;
  ptr_R_WriteConsoleEx	= Re_WriteConsoleEx;
  ptr_R_WriteConsole	= NULL;
  ptr_R_ReadConsole	= NULL;
  setup_Rmainloop();
  rexpress("print(runif(1)); y=x+1");
  rexpress("j+1");

  return(0);
}


JNIEXPORT jint JNICALL Java_org_godhuli_rhipe_bridge_REngineCore_intializeR
(JNIEnv *env, jobject obj, jstring rhome, jobjectArray a)
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
  char ** argv	= (char**) malloc((argc)*sizeof(char*));
  for(int i=0; i < argc;i++){
    jstring o=(jstring)(env->GetObjectArrayElement(a, i));
    const char *c=env->GetStringUTFChars(o, 0);
    argv[i] = strdup(c);
    env->ReleaseStringUTFChars(o, c);
  }
  const char * c=env->GetStringUTFChars(rhome, 0);
  char* rhomestr = strdup(c);
  // Not sure if the following code releases the argument or just 'c'
  // env->ReleaseStringUTFChars(rhome, c); 
  int initRes=initialize(argc, rhomestr,argv);
  return initRes;
}


int main(int argc, char *argv[]){
  printf("Hello Sweet World\n");
  return(1);
}
  
