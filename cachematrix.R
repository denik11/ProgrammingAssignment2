## functions return Inverse of a Matrix "x"

## makeCacheMatrix function caching the Inverse of a Matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
#set Inverse matrix NULL, when makeCacheMatrix start			
        get <- function() x
## get matrix x	
        setInverse  <- function(inverse) m <<- inverse
## set Inverse matrix, m change, when setInverse() start in  cacheSolve()		
        getInverse  <- function() m
## get Inverse matrix		
        list(get = get,
 		     setInverse = setInverse,
             getInverse = getInverse)
##makeCacheMatrix return list with 3 functions			 
}


## cacheSolve return a matrix that is the inverse of 'x'
## from cache, or, if not, with the help of function solve()
cacheSolve <- function(x, ...) {
        m <- x$getInverse()
##get Inverse matrix m		
        if(!is.null(m)) {
                message("getting cached matrix")
                return(m)
## Return a cached matrix, if m not null
        }
## if m is null (no cached matrix), begin to compute new inverse matrix		
        data <- x$get()
        m <- solve(data)
        x$setInverse (m)
## set m into makeCacheMatrix()		
        m
## Return a matrix that is the inverse of 'x' (from makeCacheMatrix) with the help of function solve()
}
