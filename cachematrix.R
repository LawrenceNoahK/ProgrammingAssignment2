## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  # holds the cached value or NULL if nothing is cached 
  # initially nothing is cached so set it to NULL 
           cache <- NULL 
            
           # store a matrix 
           setMatrix <- function(newValue) { 
                     x <<- newValue 
                     # since the matrix is assigned a new value, flush the cache 
                     cache <<- NULL 
             } 
   
  
           # returns the stored matrix 
           getMatrix <- function() { 
                     x 
             } 
  
  
           # cache the given argument  
           cacheInverse <- function(solve) { 
                     cache <<- solve 
             } 
   
  
           # get the cached value 
           getInverse <- function() { 
                     cache 
             } 
            
          # return a list. Each named element of the list is a function 
           list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)

}


## Write a short comment describing this function

#The following function calculates the inverse of a "special" matrix created with  
# makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        # get the cached value
       i <- x$getinverse()
       # if a cached value exists return it
       if(!is.null(i)) { 
             message("getting cached data") 
            return(i) 
      } 
      # otherwise get the matrix, caclulate the inverse and store it in the cache
      m <- x$get() 
       i <- solve(m, ...) 
       x$setinverse(i) 
       i 
   } 
