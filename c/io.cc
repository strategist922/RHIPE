#include "global.h"
#include "misc.h"

void Re_ShowMessage
(const char* message){
  LOGG("ShowMessage: %s",message);
}

void Re_WriteConsoleEx
(const char * message, int a, int b ){
  LOGG("WriteConsole[%d,%d]: %s", a, b,message);
}
