}
get <- function() x
setsolve <- function(solve) s <<- solve
getsolve <- function() s
list(set = set, 
     get = get,
     setsolve = setsolve,
     getsolve = getsolve)
}

# Part 2 get inverse of matrix x ----
# Functions will:
# Check to see the mean has been calculated, then retrieve it from the cache

cacheSolve <- function(x, ...) {
        s <- x$getsolve()
        if(!is.null(s)) {
                message("getting the inversed matrix")
                return(s)
        }
        data <- x$get()
        s <- solve(data, ...)
        x$setsolve(s)
}

# Also, check it
NewMatrix <- makeCacheMatrix(matrix(1:4, 2, 2))
NewMatrix$get()
NewMatrix$getInverse()
cacheSolve(NewMatrix)
NewMatrix$getInverse()
cacheSolve(NewMatrix)
NewMatrix$get()
NewMatrix$getInverse()
cacheSolve(NewMatrix)
