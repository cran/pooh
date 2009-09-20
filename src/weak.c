
static void update(int *ff, int p0, int q0)
{
    int p1, q1;

    p1 = ff[p0];
    q1 = ff[q0];

    while (p1 != q1)
        if (q1 < p1) {
            ff[p0] = q1;
            p0 = p1;
            p1 = ff[p1];
        } else {
            ff[q0] = p1;
            q0 = q1;
            q1 = ff[q1];
        }
}

#include <R.h>

void weak(int *from, int *to, int *lenfrom, int *result, int *lenresult)
{
    int m = lenfrom[0];
    int n = lenresult[0];

    for (int i = 0; i < m; ++i) {
        if (from[i] <= 0 || from[i] > n)
            error("from out of range");
        if (to[i] <= 0 || to[i] > n)
            error("to out of range");
    }

    for (int i = 0; i < n; ++i)
        result[i] = i;

    /* inside here we use zero-origin indexing, R uses one-origin indexing */
    for (int i = 0; i < m; ++i)
        update(result, from[i] - 1, to[i] - 1);

    for (int i = 0; i < n; ++i)
        result[i] = result[result[i]];
}

