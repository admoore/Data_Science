makeCacheMatrix <- function(x) {
  m <- NULL
  x<<-matrix(x)
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setsolve <- function(inverse) m <<- inverse
  getsolve <- function() m
  list(get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


cacheSolve<- function(z) {
    m <- z$getsolve()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- z$get()
    m <-solve(data)
    z$setsolve(m)
    m
} 



  