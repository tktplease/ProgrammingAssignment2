## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  m <- matrix(,)
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)

}




## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  if (!ismatrix(x)) {
    message("arguement is not matrix")
    return(NA)
  }
    
  data <- x$get()
  m <- solve(data, ...)
  m
  x$setmean(m)
  m
}

mtx <- rbind(c(1,1/4),c(1/4,1))
x <- makeCacheMatrix(mtx)
cacheSolve(x)
