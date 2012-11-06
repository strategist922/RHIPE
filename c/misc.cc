#include "misc.h"
#include "Rincludes.h"

#include <time.h>
#include <stdarg.h>
#include <stdio.h>

FILE* LOG = stderr;

void logg
(const char *fmt, ...)
{
  char s[100];
  size_t i;
  struct tm tim;
  time_t now;
  now = time(NULL);
  tim = *(localtime(&now));
  i = strftime(s,30,"[%b %d, %Y; %H:%M:%S]",&tim);
  s[i]='\0';
  va_list args;
  va_start(args,fmt);
  fprintf(LOG,"RHIPE %s:",s);
  vfprintf(LOG,fmt,args);
  fprintf(LOG,"\n");
  va_end(args);
  fflush(LOG);
}

SEXP rexpress(const char* cmd)
{
  SEXP cmdSexp, cmdexpr, ans = R_NilValue;
  int i;
  ParseStatus status;
  PROTECT(cmdSexp = Rf_allocVector(STRSXP, 1));
  SET_STRING_ELT(cmdSexp, 0, Rf_mkChar(cmd));
  cmdexpr = PROTECT(R_ParseVector(cmdSexp, -1, &status, R_NilValue));
  if (status != PARSE_OK) {
    UNPROTECT(2);
    Rf_error("RHIPE: invalid call: %s", cmd);
    return(R_NilValue);
  }
  for(i = 0; i < Rf_length(cmdexpr); i++)
    ans = Rf_eval(VECTOR_ELT(cmdexpr, i), R_GlobalEnv);
  UNPROTECT(2);
  return(ans);
}
