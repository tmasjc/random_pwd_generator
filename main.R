# Tue Jul 31 16:24:21 2018 ------------------------------


# Header ------------------------------------------------------------------

library(tidyverse)
library(plumber)
library(cli)


# List of Materials -------------------------------------------------------

words <- list(
    animal = list("dog", "cat", "cow", "tiger", "rabbit"),
    color = list("red", "green", "blue", "black", "white"),
    greek = list("alpha", "gamma", "theta", "sigma", "rho")
)



# Main --------------------------------------------------------------------

# extract xxx-xxx-xxx
get_n <- function(n = 1){
    
    words %>% 
        expand.grid() %>% 
        sample_n(n) %>% 
        flatten()
}

# format result
format_and_return <- function(res) {
    
    # tag name to list
    names(res) <- paste0("x", 1:length(res))
    
    res
    
}


# Expose API --------------------------------------------------------------

#* Generate a single password
#* @param sep The seperator between words
#* @get /gen_password
function(req, sep = "-") {
    
    res <- get_n(1) %>% 
        unlist() %>% 
        paste0(collapse = sep)
    
    # print to console
    cat_line("--- PASSWORD GENERATED ---", col = "lightgreen")
    
    # return
    format_and_return(res)
}
    
#* Generate n password
#* @param n Numbers of password 
#* @param sep The seperator between words
#* @get /gen_n_password
function(req, n = 3, sep = "-") {
    
    res <- map(1:n, ~ {
        get_n(1) %>% 
            unlist() %>% 
            paste0(collapse = sep)
    })
    
    # print to console
    paste("--- {", n, "} PASSWORD GENERATED ---") %>% 
        cat_line(col = "green")
    
    
    # return 
    format_and_return(res)
}




