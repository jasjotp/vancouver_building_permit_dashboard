# implements: input as the date range
#             Reactive calc: as the filtered_df
#             Outputs: value/text output for total permits isssued, value/text output for average processing time, and line plot for permit volume over time/
# used the following link for documentation, along with our group's existing Python project: https://rstudio.github.io/cheatsheets/html/shiny.html and https://rstudio.github.io/shiny/reference/titlePanel.html
library(shiny)
library(dplyr)
library(ggplot2)
library(arrow)
library(lubridate)
library(readr)

# set the issue date and applied date for the permit to act as the input (user input a date range)
ISSUE_DATE <- "IssueDate"
APPLIED_DATE <- "PermitNumberCreatedDate"

permits_df <- read_delim("../data/raw/issued-building-permits.csv") |>
  mutate(
    IssueDate = as_date(IssueDate),
    PermitNumberCreatedDate = as_date(PermitNumberCreatedDate)
  )

EARLIEST_ISSUE_DATE <- min(permits_df[[ISSUE_DATE]], na.rm = TRUE)
LATEST_ISSUE_DATE <- max(permits_df[[ISSUE_DATE]], na.rm = TRUE)

ui <- fluidPage(
  titlePanel("Vancouver Building Permits Dashboard"),
  
  sidebarLayout(
    sidebarPanel(
      dateRangeInput(
        "date_range",
        "Date Range",
        start = EARLIEST_ISSUE_DATE,
        end = LATEST_ISSUE_DATE,
        min = EARLIEST_ISSUE_DATE,
        max = LATEST_ISSUE_DATE
      )
    ),
    
    mainPanel(
      h4("Permits issued"),
      textOutput("permits_to_date"),
      
      h4("Average Processing Time"),
      textOutput("avg_days"),
      
      h4("Permit Volume Over Time"),
      plotOutput("permit_volume_trend")
    )
  )
)

server <- function(input, output, session) {
  
  filtered_df <- reactive({
    permits_df |>
      filter(
        .data[[ISSUE_DATE]] >= input$date_range[1],
        .data[[ISSUE_DATE]] <= input$date_range[2]
      )
  })
  
  output$permits_to_date <- renderText({
    format(nrow(filtered_df()), big.mark = ",")
  })
}


shinyApp(ui = ui, server = server)


