\name{tsort}
\alias{tsort}
\title{Topological Sort}
\concept{partial order}
\concept{total order}
\concept{directed acyclic graph}
\concept{graph component}
\description{
  Find One Total Order Consistent with Partial Order or With Directed
  Acyclic Graph
}
\usage{
tsort(from, to, domain, strict = TRUE)
}
\arguments{
  \item{from}{an atomic vector}
  \item{to}{an atomic vector of the same mode and length as \code{from}}
  \item{domain}{an atomic vector of the same mode as \code{from} containing
      all the elements of \code{from} and \code{to}.  If missing,
      \code{union(from, to)} is used.  The domain of the relation or the
      nodes of the graph.}
  \item{strict}{logical.  If \code{TRUE} then \code{from[i] == to[i]} is
      an error.  Otherwise, such edges of the graph are ignored.}
}
\details{
Pairs \code{(from[i], to[i])} can be though of either as elements of
a relation on a set or as edges in a directed graph.
This function finds one total order on the domain (nodes of the graph)
that is consistent with the relation (graph) if one exists (that is if the
graph is directed).
}
\value{
A vector that is a reordering of \code{domain} so that every element of
\code{from} appears in the value before the corresponding element of \code{to}.

Throws an error if there is no consistent total order (the graph has a cycle).
}
\examples{
from <-   LETTERS[c(1, 1, 1, 1, 2, 2, 6)]
to <- LETTERS[c(2, 3, 4, 5, 3, 5, 7)]
from
to
tsort(from, to)
}
\keyword{misc}
