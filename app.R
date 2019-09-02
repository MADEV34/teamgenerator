library(shinydashboard)
library(rsconnect)
library(shinyjs)
library(shinythemes)

ui <- dashboardPage(dashboardHeader(disable = T) , dashboardSidebar(disable = T),
                    
                    dashboardBody(
                        fluidPage(useShinyjs(), theme = shinytheme("united"),
                            titlePanel("Générateur d'équipe aléatoire"), align = "center"),
                        
                        fluidRow(

                            column(width = 1),
                            column(width = 4,
                                   box(
                                       title = "Liste des joueurs", status = "primary", solidHeader = T, width = NULL, align = "center",
                                       splitLayout(textInput("player1", NULL, value = "", width = NULL, placeholder = "Nom du joueur 1"),
                                       textInput("player2", NULL, value = "", width = NULL, placeholder = "Nom du joueur 2")),
                                       splitLayout(textInput("player3", NULL, value = "", width = NULL, placeholder = "Nom du joueur 3"),
                                       textInput("player4", NULL, value = "", width = NULL, placeholder = "Nom du joueur 4")),
                                       splitLayout(textInput("player5", NULL, value = "", width = NULL, placeholder = "Nom du joueur 5"),
                                       textInput("player6", NULL, value = "", width = NULL, placeholder = "Nom du joueur 6")),
                                       splitLayout(textInput("player7", NULL, value = "", width = NULL, placeholder = "Nom du joueur 7"),
                                       textInput("player8", NULL, value = "", width = NULL, placeholder = "Nom du joueur 8")),
                                       splitLayout(textInput("player9", NULL, value = "", width = NULL, placeholder = "Nom du joueur 9"),
                                       textInput("player10", NULL, value = "", width = NULL, placeholder = "Nom du joueur 10")),
                                       splitLayout(textInput("player11", NULL, value = "", width = NULL, placeholder = "Nom du joueur 11"),
                                       textInput("player12", NULL, value = "", width = NULL, placeholder = "Nom du joueur 12")),
                                       splitLayout(textInput("player13", NULL, value = "", width = NULL, placeholder = "Nom du joueur 13"),
                                       textInput("player14", NULL, value = "", width = NULL, placeholder = "Nom du joueur 14")),
                                       splitLayout(textInput("player15", NULL, value = "", width = NULL, placeholder = "Nom du joueur 15"),
                                       textInput("player16", NULL, value = "", width = NULL, placeholder = "Nom du joueur 16")),
                                       splitLayout(textInput("player17", NULL, value = "", width = NULL, placeholder = "Nom du joueur 17"),
                                       textInput("player18", NULL, value = "", width = NULL, placeholder = "Nom du joueur 18")),
                                       splitLayout(textInput("player19", NULL, value = "", width = NULL, placeholder = "Nom du joueur 19"),
                                       textInput("player20", NULL, value = "", width = NULL, placeholder = "Nom du joueur 20")),
                                       actionButton("go","Formation des équipes")
                                       
                                   )
                                   
                            ),
                            
                            column(width = 3,
                                   
                                   box(
                                       title = NULL, width = NULL, solidHeader = T, status = "primary", align = "center",
                                       "Équipe 1",br(), br(),
                                       
                                       splitLayout(textOutput("player1a"), textOutput("player1b"))
                                       
                                   ),
                                   
                                   box(
                                       title = NULL, width = NULL, solidHeader = T, status = "primary", align = "center",
                                       "Équipe 2",br(), br(),
                                       
                                       splitLayout(textOutput("player2a"), textOutput("player2b"))
                                       
                                   ),
                                   
                                   box(
                                       title = NULL, width = NULL, solidHeader = T, status = "primary", align = "center",
                                       "Équipe 3",br(), br(),
                                       
                                       splitLayout(textOutput("player3a"), textOutput("player3b"))
                                       
                                   ),
                                   box(
                                       title = NULL, width = NULL, solidHeader = T, status = "primary", align = "center",
                                       "Équipe 4",br(), br(),
                                       
                                       splitLayout(textOutput("player4a"), textOutput("player4b"))
                                       
                                   ),
                                   box(
                                       title = NULL, width = NULL, solidHeader = T, status = "primary", align = "center",
                                       "Équipe 5",br(), br(),
                                       
                                       splitLayout(textOutput("player5a"), textOutput("player5b"))
                                       
                                   )
                            ),
                            
                            column(width = 3,
                                   
                                   box(
                                       title = NULL, width = NULL, solidHeader = T, status = "primary", align = "center",
                                       "Équipe 6", br(), br(),
                                       
                                       splitLayout(textOutput("player6a"), textOutput("player6b"))
                                       
                                   ),
                                   
                                   box(
                                       title = NULL, width = NULL, solidHeader = T, status = "primary", align = "center",
                                       "Équipe 7",br(), br(),
                                       
                                       splitLayout(textOutput("player7a"), textOutput("player7b"))
                                       
                                   ),
                                   
                                   box(
                                       title = NULL, width = NULL, solidHeader = T, status = "primary", align = "center",
                                       "Équipe 8",br(), br(),
                                       
                                       splitLayout(textOutput("player8a"), textOutput("player8b"))
                                       
                                   ),
                                   box(
                                       title = NULL, width = NULL, solidHeader = T, status = "primary", align = "center",
                                       "Équipe 9",br(), br(),
                                       
                                       splitLayout(textOutput("player9a"), textOutput("player9b"))
                                       
                                   ),
                                   box(
                                       title = NULL, width = NULL, solidHeader = T, status = "primary", align = "center",
                                       "Équipe 10",br(), br(),
                                       
                                       splitLayout(textOutput("player10a"), textOutput("player10b"))
                                       
                                   ))
                            
        )                    
    )
)

## Serveur
server <- function(input, output) {
    

    
    player <- reactive({ sample(c(input$player1, input$player2,input$player3,input$player4,input$player5,input$player6,
                                   input$player7,input$player8,input$player9,input$player10, input$player11,input$player12,
                                   input$player13,input$player14,input$player15,input$player16,input$player17,input$player18,
                                   input$player19,input$player20))})
    
    players <- reactive({player()[player() != ""]})

    
    observeEvent(input$go,
    { 
                    output$player1a <- renderText({players()[1]})
                    output$player1b <- renderText({players()[2]})

                     output$player2a <- renderText({players()[3]})
                     output$player2b <- renderText({players()[4]})

                     output$player3a <- renderText({players()[5]})
                     output$player3b <- renderText({players()[6]})

                     output$player4a <- renderText({players()[7]})
                     output$player4b <- renderText({players()[8]})

                     output$player5a <- renderText({players()[9]})
                     output$player5b <- renderText({players()[10]})

                     output$player6a <- renderText({players()[11]})
                     output$player6b <- renderText({players()[12]})

                     output$player7a <- renderText({players()[13]})
                     output$player7b <- renderText({players()[14]})

                     output$player8a <- renderText({players()[15]})
                     output$player8b <- renderText({players()[16]})

                     output$player9a <- renderText({players()[17]})
                     output$player9b <- renderText({players()[18]})

                     output$player10a <- renderText({players()[19]})
                     output$player10b <- renderText({players()[20]})
    })
                     
 
    observeEvent(input$go,
                 {disable("player1")})
    observeEvent(input$go,
                 {disable("player2")})
    observeEvent(input$go,
                 {disable("player3")})
    observeEvent(input$go,
                 {disable("player4")})
    observeEvent(input$go,
                 {disable("player5")})
    observeEvent(input$go,
                 {disable("player6")})
    observeEvent(input$go,
                 {disable("player7")})
    observeEvent(input$go,
                 {disable("player8")})
    observeEvent(input$go,
                 {disable("player9")})
    observeEvent(input$go,
                 {disable("player10")})
    observeEvent(input$go,
                 {disable("player11")})
    observeEvent(input$go,
                 {disable("player12")})
    observeEvent(input$go,
                 {disable("player13")})
    observeEvent(input$go,
                 {disable("player14")})
    observeEvent(input$go,
                 {disable("player15")})
    observeEvent(input$go,
                 {disable("player16")})
    observeEvent(input$go,
             {disable("player17")})
    observeEvent(input$go,
             {disable("player18")})
    observeEvent(input$go,
             {disable("player19")})
    observeEvent(input$go,
             {disable("player20")})
    observeEvent(input$go,
                 {disable("go")})
    
    
}

shinyApp(ui = ui, server = server)