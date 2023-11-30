library(shiny)

ui <- fluidPage(
    titlePanel("Dynamic Docker UI"),
    
    sidebarLayout(
        sidebarPanel(
            selectInput("dockerType", "Select Docker Container Type:", 
                        choices = c("Type1", "Type2", "Type3")),
            uiOutput("dynamicInputs"),
            actionButton("run", "Run")
        ),
        
        mainPanel(
           plotOutput("outputPlot"),
           verbatimTextOutput("outputText")
        )
    )
)
