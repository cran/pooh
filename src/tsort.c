
// topological sort
// trick of using stack to make algorithm linear time taken from
// http://courses.cs.washington.edu/courses/cse326/03wi/lectures/RaoLect20.pdf

#include <R.h>
#include <stddef.h>

void tsort(int *from, int *to, int *lenfrom, int *result, int *lenresult)
{
    int m = lenfrom[0];
    int n = lenresult[0];

    for (int i = 0; i < m; ++i) {
        if (from[i] <= 0 || from[i] > n)
            error("from out of range");
        if (to[i] <= 0 || to[i] > n)
            error("to out of range");
    }

    int *stack = (int *) R_alloc(n, sizeof(int));
    int nstack = 0;
    int *indegree = (int *) R_alloc(n, sizeof(int));
    typedef struct cell { int val; struct cell *next; } cell_t;
    cell_t *tolistcell = (cell_t *) R_alloc(m, sizeof(cell_t));
    cell_t **tolist = (cell_t **) R_alloc(n, sizeof(cell_t *));

    // stack is for a stack of nodes known to have indegree zero
    // nstack is number of items on the stack (right now, stack is empty)
    // indegree[i] is the number of incoming edges to node [i]
    // tolist[i] is a pointer to a list of nodes that edges go to from the
    //     i-th node

    for (int i = 0; i < n; ++i) {
        indegree[i] = 0;
        tolist[i] = NULL;
    }

    for (int i = 0; i < m; ++i) {
        // convert to zero-origin indexing
        int ifrom = from[i] - 1;
        int ito = to[i] - 1;
        if (ifrom != ito) {
            ++indegree[ito];
            tolistcell[i].val = ito;
            tolistcell[i].next = tolist[ifrom];
            tolist[ifrom] = &tolistcell[i];
        }
    }

    for (int i = 0; i < n; ++i)
        if (indegree[i] == 0)
            stack[nstack++] = i;

    // initialization done

    if (nstack == 0)
        error("cyclic graph");

    for (int i = 0; i < n; ++i) {

        if (nstack == 0)
            error("can't happen: a bug");
        int j = stack[--nstack];

        // convert back to one-origin indexing
        result[i] = j + 1;

        // remove this node and its outgoing edges from the graph
        for (cell_t *p = tolist[j]; p != NULL; p = p->next) {
            --indegree[p->val];
            if (indegree[p->val] == 0)
                stack[nstack++] = p->val;
        }
    }
}

