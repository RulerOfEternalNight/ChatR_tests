library(ellmer)

resourceR <- readLines("C:\\Users\\tonyw\\Desktop\\Projects\\R\\GRP\\resource.txt")
#print(resourceR)
sysPrompt <- paste("You are a R expert. use the following resource to answer any questions: ", paste(resourceR, collapse = " "), sep = "")
#print(sysPrompt)

chat <- chat_ollama(
  model = "llama3.2:3b-instruct-q4_K_M",
  system_prompt = sysPrompt
)

#query <- "How do you register a native C function in an R package?"
query <- "Is using C code to speed up the execution of an R function fruitful?"
#query <- "Give a small example of creating an R numeric vector in C code"

response <- chat$chat(query)
