library(shiny)

# Define UI for application of pk1c ----

navbarPage(
  title = "pk1cima: PK Sim of 1 Comp, IV Bolus",
  
  ## Data ----
  tabPanel(
    title = "Data",
    sidebarLayout(
      sidebarPanel(
        sliderInput("nSubj", "Subjects", min = 1, max = 100, value = 10),
        sliderInput("CL", "Clearance", min = 1, max = 50, value = 30),
        sliderInput("V", "Volume of Distribution", min = 1, max = 500, value = 100),
        textInput("Time", "Sampling Time", value = "0, 0.25, 0.5, 1, 2, 4, 5, 7, 9, 12, 24"),
        textInput("DH1", "Dose Hx(t, Dose, t, Dose, ...)", value = "0, 100000"),
        textInput("FullCov", "Full Covariance (2x2 matrix)", value = "0.04, 0.03, 0.03, 0.04"),
        sliderInput("PropE", "Proportional Error (SD)", min = 0, max = 1, value = 0.1, step = 0.1),
        sliderInput("AddE", "Additive Error (SD)", min = 0, max = 1, value = 1, step = 0.1),
        sliderInput("Jitter", "Time Jitter", min = 0, max = 10, value = 1, step = 1)
      ),
      
      mainPanel(
        tags$h2("Concentration-time Curves"),
        plotOutput("concTimePlot"),
        checkboxInput(inputId = "concLog", label = "Log scale")
      )
    )
  ),
  
  ## Plot ----
  tabPanel(
    title = "Details",
    tags$h2("Individual Plots"),
    plotOutput("concTimeFacet", height = "800px"),
    tags$h2("Raw Data"),
    tableOutput("concTable")
  ),
  
  tabPanel(
    title = "NCA",
    tags$h2("NCA"),
    tags$h4("Noncompartmental Analysis of Simulated Dataset using `NonCompart` package"),
    tableOutput("ncarTable"),
    includeMarkdown("parameters.md")
  ),
  
  ### 90 ###
  tabPanel(
    title = "Help", 
    includeMarkdown("README.md")
    #htmlOutput('README')
  ),
  ### 99 ###
  tabPanel(
    title = "Contact", 
    includeMarkdown("CONTACT.md")
  )
)

