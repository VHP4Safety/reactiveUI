server <- function(input, output) {
    # Define the Docker types and their respective inputs and outputs
    dockerTypes <- list(
        Type1 = list(inputs = c("mean", "std_dev", "num_samples"), output = "plot"),
        Type2 = list(inputs = c("input1", "input2"), output = "text"),
        Type3 = list(inputs = c("param1"), output = "plot")
        # ... other types
    )
    
    # Dynamic UI based on selected Docker type
    output$dynamicInputs <- renderUI({
        inputList <- dockerTypes[[input$dockerType]]$inputs
        inputUIs <- lapply(inputList, function(i) {
            numericInput(i, sprintf("Enter %s:", i), value = 0)
        })
        do.call(tagList, inputUIs)
    })
    
    # Handle Run action
    observeEvent(input$run, {
        # Get the type of output expected
        outputType <- dockerTypes[[input$dockerType]]$output
        
        # Construct and run Docker command based on inputs
        # ...

        # Display output based on the type
        if (outputType == "plot") {
            # Code to display a plot
        } else if (outputType == "text") {
            # Code to display text
        }
        # ... other output types
    })
}
