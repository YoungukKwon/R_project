# prepare data frame
set.seed(1)
mat <- matrix(runif(1000*1000), ncol=1000, nrow=1000)
df <- as.data.frame(mat)


# for loop function 
fun1 <- function(x) {
  start_time <- Sys.time()
  z <- NULL
  for (i in 1:1000) {
    z[i] <- sum(x[,i])
  }
  end_time <- Sys.time()
  elapsed_time <- round(as.numeric(difftime(time1=end_time,
                                    time2=start_time,
                                    units="secs")), 3)
  return(elapsed_time)
}

# sapply function
fun2 <- function(x) {
  start_time <- Sys.time()
  z <- NULL
  z <- sapply(x, sum)
  end_time <- Sys.time()
  elapsed_time <- round(as.numeric(difftime(time1=end_time,
                                    time2=start_time,
                                    units="secs")), 3)
  return(elapsed_time)
}


# compare time difference: 100 trials
loop_100 <- vector(mode="numeric", 100)
apply_100 <- vector(mode="numeric", 100)
for (i in 1:100) {
  loop_100[i] <- fun1(df)
  apply_100[i] <- fun2(df)
}
loop_100 - apply_100   # Using sapply function takes less time than using for loop.
mean(loop_100-apply_100)   # avearge time difference = 0.02s
