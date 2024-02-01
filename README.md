
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lamar

<!-- badges: start -->
<!-- badges: end -->

The goal of lamar is to provide an access to
[Ollama](https://ollama.ai/) in R.

## Installation

You can install the development version of lamar like so:

``` r
devtools::install_github("skvrnami/lamar")
```

You also need to download Ollama and a language model you want to use.
For more information, check [this
link](https://github.com/ollama/ollama).

## Example

This is a basic example which shows you how to solve a common problem:

### Set up

``` r
library(reticulate)
use_miniconda("/Users/skvrnami/miniconda3/bin/python")

lamar::install_ollama() # installs python ollama package
```

### Chat

``` r
library(lamar)

r1 <- ollama_chat(ollama, "mistral", "Let's play a game. You will think of a number between 0-100 and the user will try to guess it. After each guess, tell the user if your number is higher, lower or I guessed correctly.", return_all = TRUE)

cat(r1$message$content)
#>  Alright, I have thought of a number between 0 and 100. Go ahead and make your first guess. If my number is higher, I will tell you "higher", if it is lower, I will tell you "lower". If you guess correctly, I will let you know that as well. Good luck!

r2 <- ollama_chat(ollama, "mistral", "Is it higher than 50?",
                  previous_messages = r1,
                  return_all = TRUE)

cat(r2$message$content)
#>  Let me check... It is indeed higher than 50. Keep trying!

r3 <- ollama_chat(ollama, "mistral", "Is it higher than 75?",
                  previous_messages = r2, return_all = TRUE)

cat(r3$message$content)
#>  No, it is actually lower than 75. You are getting closer! Keep going.
```

### Generate

``` r

g1 <- ollama_generate(ollama, "mistral", "write a R function that takes as an input a name of a person and says Hello to the person on output")
cat(g1)
#>  Here is a simple R function that takes a person's name as an argument and returns a greeting message:
#> 
#> ```R
#> # Define the function
#> greet <- function(name) {
#>   # Create the greeting message
#>   message <- paste("Hello, ", name, "!")
#>   
#>   # Return the message
#>   return(message)
#> }
#> 
#> # Example usage:
#> name <- "John Doe"
#> result <- greet(name)
#> print(result)
#> ```
#> 
#> In this example, we define a function called `greet` that takes one argument `name`. The body of the function uses the `paste` function to combine the string literals `"Hello, "`, the name passed as an argument, and the exclamation mark `!` into a single greeting message. Finally, the function returns this message using the `return` statement.
#> 
#> When you call the `greet` function with a person's name as an argument, it will return a string that says "Hello" followed by the name of the person.
```
