## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
    #creates a matrix-like object with a cached inverse
    #assume that the argument x is an invertible matrix (square + nonsingular)
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y=x) {
        x <<-y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(solve) inv<<- solve
    getinv <- function() inv
    list(set=set, get=get, 
         setinv = setinv,
         getinv = getinv)
}


## Write a short comment describing this function
    #find the inverse of matrix-like objects
    #if the object has a cached inverse use it instead of solving for the inverse again
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinv()
    if(!is.null(inv)){
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    return(inv)
}