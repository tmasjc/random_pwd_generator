library(plumber)

r <- plumb(file = "main.R")

r$run(host = "0.0.0.0", port = 8899)