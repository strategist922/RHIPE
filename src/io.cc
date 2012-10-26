#include "global.h"
#include "misc.h"

void Re_ShowMessage
(const char* message){
  LOGG(message);
}

void Re_WriteConsoleEx
(const char * message, int a, int b ){
  LOGG("%s [%d,%d]",message, a, b);
}
