tsort <- function(from, to, domain) {
    stopifnot(is.atomic(from))
    stopifnot(is.atomic(to))
    stopifnot(mode(from) == mode(to))
    stopifnot(length(from) == length(to))
    stopifnot(all(! is.na(from)))
    stopifnot(all(! is.na(to)))

    if (missing(domain)) {
        domain <- union(from, to)
    } else {
        stopifnot(all(from %in% domain))
        stopifnot(all(to %in% domain))
    }
    efrom <- match(from, domain)
    eto <- match(to, domain)
    out <- .C("tsort", from = as.integer(efrom), to = as.integer(eto),
        lenfrom = as.integer(length(efrom)), result = integer(length(domain)),
        lenresult = as.integer(length(domain)), PACKAGE = "pooh")
    sout <- domain[out$result]
    return(sout)
}
