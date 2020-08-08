## I'm going to use a function that can create a matrix which
## like in the example is actually a list containing a function to
## set the value of the matrix, get the value of the matrix,
## set the value of the inverse and get the value of the inverse


makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function (y) {
    x <<- y
    i <<- NULL
  }
get <- function() x
setinverse <- function(inverse) i <<- inverse
getinverse <- function() i
list (set = set, get = get,
      setinverse = setinverse,
      getinverse = getinverse)

}


## Now, the following function calculate the inverse of the matrix,
## but first it checks if it has been already calculated and gives
## the solution

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
