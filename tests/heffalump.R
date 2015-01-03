
 library(pooh)

 set.seed(42)

 m <- 200
 n <- 500
 
 d <- seq(1:m)
 foo <- sample(d, n, replace = TRUE)
 bar <- sample(d, n, replace = TRUE)
 baz <- pmin(foo, bar)
 qux <- pmax(foo, bar)

 quacks <- tsort(baz, qux, d)

 length(quacks) == length(d)
 identical(sort(quacks), d)
 idx <- match(baz, quacks)
 jdx <- match(qux, quacks)
 all(idx <= jdx)

 quacks <- try(tsort(1:2, 2:1))

