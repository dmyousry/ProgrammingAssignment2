## Put comments here that give an overall description of what your
## functions do

## tested using a matrix  a<-matrix(rnorm(25),nrow=5,ncol=5)


## Function to get/set matrix and matrix inverse, as well as chaching the inverse
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setmatrixinverse <- function(matrixinverse = matrix()) inverse <<- matrixinverse
  getmatrixinverse <- function() inverse
  list(setmatrix = set, getmatrix = get,
       setmatrixinverse = setmatrixinverse,
       getmatrixinverse = getmatrixinverse)
}

    

##Function to check if inverse is cached or not, and if cached, it returns it,
##if not, it calculates it and sets it in the cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse<-x$getmatrixinverse()
  if(!is.null(inverse)){
    message("Data already cached")
    return(inverse)
  }
  message("Data not cached, and calculated for the first time")
  inverse<-solve(x$getmatrix())
  x$setmatrixinverse(inverse)
  inverse
  
}
