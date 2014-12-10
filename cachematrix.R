## functions return Inverse of a Matrix "x"

## makeCacheMatrix function caching the Inverse of a Matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
## set matrix		
                x <<- y
                m <<- NULL
        }
        get <- function() x
## get matrix	
        setInverse  <- function(inverse) m <<- inverse
## set Inverse matrix		
        getInverse  <- function() m
## get Inverse matrix		
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## cacheSolve return a matrix that is the inverse of 'x'
## from cache, or, if not, with the help of function solve()
cacheSolve <- function(x, ...) {
        m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached matrix")
                return(m)
## Return a cached matrix
        }
        data <- x$get()
        m <- solve(data)
        x$setInverse (m)
        m
## Return a matrix that is the inverse of 'x' (from makeCacheMatrix) with the help of function solve()
}
