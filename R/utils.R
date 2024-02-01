# https://rstudio.github.io/rstudioaddins/

print.ollama_response <- function(x){
    cat(x)
}

create_messages_dict <- function(x){
    reticulate::dict(
        role = x$message$role,
        content = x$message$content
    )
}

get_previous_messages <- function(output){
    c(
        output$input,
        reticulate::dict(
            role = output$message$role,
            content = output$message$content
        )
    )

}

#' Chat
#'
#' @param ollama Imported module from R
#' @param model ollama model to be used
#' @param query
#' @param previous_messages
#' @param return_all return the whole output (default is FALSE)
#'
#' @export
ollama_chat <- function(ollama, model, query, previous_messages = NULL,
                        return_all = FALSE){
    if(is.null(previous_messages)){
        input <- c(
            reticulate::dict(
                role = "user",
                content = query
            ))
    }else{
        input <- c(
            get_previous_messages(previous_messages),
            reticulate::dict(
                role = "user",
                content = query
            )
        )
    }

    out <- ollama$chat(model = model,
                       messages = input)
    out$input <- input

    if(return_all) return(out)
    out <- out$message$content
    class(out) <- "ollama_response"
    out
}

#' Generate
#'
#' @param ollama Imported module from R
#' @param model ollama model to be used
#' @param query
#' @param return_all return the whole output (default is FALSE)
#'
#' @export
ollama_generate <- function(ollama, model, query, return_all = FALSE){
    out <- ollama$generate(model = model, prompt = query)

    if(return_all) return(out)
    out <- out$response
    out
}
