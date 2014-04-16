# Here are some funtions to creat a CacheMatrix that can cache its inverse
#  and to get its inverse

# when you want to use a CacheMatrix called "x"
# Please run " x <- makeCacheMatrix() " first

# if you want to set the value() of x
# run " x$set("value you want") "
# or run "x <- makeCacheMatrix("value you want")"

# if you want to get the value() of x
# run " x$get() "

# if you want to get the inverse of x
# run "cachesolve(x)"

# you can run "x$get() %*% cachesolve(x)"
# to see if the inverse of x is correct

# BTW: I would not like to operate Matrix like this


makeCacheMatrix <- function(x = matrix()) { 
    inv <- NULL      
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function() inv <<- solve(x) 
    getinv <- function() inv
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}    #just like the sample makeVector

cachesolve <- function(x) {
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    x$setinv()     #update the inv
    x$getinv()
}