library(ellmer)

# Read resource file and make the system prompt for the model
resourceR <- readLines("C:\\Users\\tonyw\\Desktop\\Projects\\R\\GRP\\resource.txt")
sysPrompt <- paste("You are an R expert. Return only the exported function names of the package. Do not include explanations or additional text. Use the following resource content for reference:\n",
                   paste(resourceR, collapse = " "), sep = "")

# Function to list exported functions
ListFns <- function(packageName) {
  query <- paste("List the exported function names of the R package", packageName,
                 ". Only return the function names, no extra text or formatting.")

  chat <- chat_ollama(
    model = "llama3.2:3b-instruct-q4_K_M",
    system_prompt = sysPrompt
  )

  response <- chat$chat(query)

  if (length(response) > 0) {
    return(strsplit(response, "\n")[[1]])
  } else {
    return(NULL)
  }
}
