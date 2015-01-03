\name{weak}
\alias{weak}
\title{Equivalence Classes}
\concept{equivalence relation}
\concept{equivalence class}
\concept{graph component}
\description{
  Calculates Equivalence Classes
}
\usage{
weak(from, to, domain, markers = FALSE)
}
\arguments{
  \item{from}{an atomic vector}
  \item{to}{an atomic vector of the same mode and length as \code{from}}
  \item{domain}{an atomic vector of the same mode as \code{from} containing
      all the elements of \code{from} and \code{to}.  If missing,
      \code{union(from, to)} is used.  The domain of the relation or the
      nodes of the graph.}
  \item{markers}{controls the type of result; see Values below.}
}
\details{
Pairs \code{(from[i], to[i])} can be though of either as elements of
a symmetric relation on a set or as edges in an undirected graph.
This function calculates the equivalence classes of the transitive
closure of the relation or the components of the graph.  If the edges
are thought of as directed, then we calculate the weak components,
meaning the components of the associated undirected graph, rather than
the so-called strong components of the directed graph.
}
\value{
If \code{markers = FALSE},
a list, elements of which are the components (equivalence classes).
If \code{markers = TRUE}, an integer vector of the same length as
\code{domain} or as \code{union(from, to)} if \code{domain} is missing,
elements of which are the same if and only if the corresponding elements
of the domain (nodes of the graph) are in the same connected component
(equivalence class).
}
\examples{
to <- sample(1:100, 75, replace = TRUE)
from <- sample(1:100, 75, replace = TRUE)
out <- weak(from, to)
sapply(out, length)
}
\keyword{misc}
