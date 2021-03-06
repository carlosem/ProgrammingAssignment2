#########################################################
## The functions below cache the inverse of a matrix   ##
## in order to minimize time-consuming computations    ##
#########################################################

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
  inverse <- NULL
  
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  
  get <- function() x
  
  setinverse <- function(inv) inverse <<- inv
  
  getinverse <- function() inverse
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## This function computes the inverse of the special "matrix" returned 
## by makeCacheMatrix. If the inverse has already been calculated 
## (and the matrix has not changed), then the cachesolve should retrieve 
## the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  inv <- x$getinverse()
  
  if (!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  
  data <- x$get()
  inverse <- solve(data)
  x$setinverse(inverse)
  inverse
  
}
