
#include <Rdefines.h>
#include <R_ext/Rdynload.h>
#include <R_ext/Visibility.h>
#include "pooh.h"

static R_NativePrimitiveArgType tsort_types[6] =
    {INTSXP, INTSXP, INTSXP, INTSXP, INTSXP, LGLSXP};

static R_NativePrimitiveArgType weak_types[5] =
    {INTSXP, INTSXP, INTSXP, INTSXP, INTSXP};

static R_CMethodDef cMethods[] = {
    {"tsort", (DL_FUNC) &tsort, 6, tsort_types},
    {"weak", (DL_FUNC) &weak, 5, weak_types},
    {NULL, NULL, 0, NULL}
};

static R_CallMethodDef callMethods[]  = {
    {NULL, NULL, 0}
};

void attribute_visible R_init_pooh(DllInfo *info)
{
    R_registerRoutines(info, cMethods, callMethods, NULL, NULL);
    R_useDynamicSymbols(info, FALSE);
    R_forceSymbols(info, TRUE);
}

