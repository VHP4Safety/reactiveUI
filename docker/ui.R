library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Distribution Analysis with Docker"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Data Input", tabName = "dataInput", icon = icon("rocket")),
      menuItem("Results", tabName = "results", icon = icon("chart-bar"))
    )
  ),
  dashboardBody(
    tabItems(
      # Tab for Data Input
      tabItem(tabName = "dataInput",
              fluidRow(
                box(title = "Parameters for Distribution 1",
                    numericInput("mean1", "Mean:", 0),
                    numericInput("std_dev1", "Standard Deviation:", 1),
                    numericInput("num_samples1", "Number of Samples:", 100)
                ),
                box(title = "Parameters for Distribution 2",
                    numericInput("mean2", "Mean:", 0),
                    numericInput("std_dev2", "Standard Deviation:", 1),
                    numericInput("num_samples2", "Number of Samples:", 100),
                    numericInput("seed", "Seed (Optional):", 123),
                    actionButton("generate", "Generate Analysis", class = "btn-primary")
                )
              )
      ),

      # Tab for Results
      tabItem(tabName = "results",
              fluidRow(
                box(title = "Distribution Plot", width = 6, plotOutput("distPlot")),
                box(title = "T-Test Result", width = 6, verbatimTextOutput("tTestResult"))
              )
      )
    )
  )
)
