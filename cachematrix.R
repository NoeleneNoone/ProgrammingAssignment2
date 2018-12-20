## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## run this first with a square matrix before calling cacheSolve
## makeCacheMatrix will add the get, set, getinverse and setinverse fucntions to the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
## run this second with the result of makeCacheMatrix
## first time it is run it will calcualte the inverse
## the second time it is run it will retrieve the inverse calcuated the first time round

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
  
}
