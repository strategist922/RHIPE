#ifndef __MISC__H__
#define __MISC__H__


#ifdef DEBUG
#define LOGG(...) logg(__VA_ARGS__)
#else
#define LOGG(...)
#endif

#include "Rincludes.h"

void logg(const char *, ...);
SEXP rexpress(const char*);
#endif
