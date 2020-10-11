# Pacotes
install.packages("shiny")
install.packages("sets")

library(shiny)
library(sets)

# Define Universo
sets_options("universe", seq(1,100, 1))

#criacao de variaveis
variaveis <- set(
  Domina_Python = fuzzy_partition(varnames = c( gemin  = 5, gemen = 15, gemed = 50, gemaior=75, gemax=90), sd = 10),
  Domina_R = fuzzy_partition(varnames = c( rimin  = 30, rimen = 35, rimed = 55, rimaior=75,rimax=85), sd = 10),
  AnaliseDeDados = fuzzy_partition(varnames = c( ecmin  = 10, ecmen = 25, ecmed = 50, ecmaior=75,ecmax=95),  sd = 10),
  Matematica = fuzzy_partition(varnames = c( plmin  = 30, plmen = 50, plmed = 70, plmaior=90,plmax=95), sd=10),
  Gosta_Estudar = fuzzy_partition(varnames = c( gsmin  = 20, gsmen = 40, gsmed = 60, gsmaior=80,gsmax=90), sd=10),
  MachineLearning = fuzzy_partition(varnames = c( hcmin  = 40, hcmen = 50, hcmed = 60, hcmaior=70, hcmax=75), sd=10),
  Classificacao = fuzzy_partition(varnames = c( baixa  = 10, media = 50, alta = 75, altissima=95), sd=10)
)

#definicao das regras
regras <-
  set(
    fuzzy_rule( Domina_Python %is%	gemax	&& Domina_R %is%	rimin	&& AnaliseDeDados %is%	ecmax	&& Matematica %is%	plmin	&& Gosta_Estudar %is%	gsmax	&& MachineLearning %is%	hcmin	, Classificacao %is%	altissima	),
    fuzzy_rule( Domina_Python %is%	gemax	&& Domina_R %is%	rimen	&& AnaliseDeDados %is%	ecmaior	&& Matematica %is%	plmin	&& Gosta_Estudar %is%	gsmax	&& MachineLearning %is%	hcmen	, Classificacao %is%	altissima	),
    fuzzy_rule( Domina_Python %is%	gemaior	&& Domina_R %is%	rimen	&& AnaliseDeDados %is%	ecmaior	&& Matematica %is%	plmin	&& Gosta_Estudar %is%	gsmax	&& MachineLearning %is%	hcmed	, Classificacao %is%	altissima	),
    fuzzy_rule( Domina_Python %is%	gemaior	&& Domina_R %is%	rimen	&& AnaliseDeDados %is%	ecmaior	&& Matematica %is%	plmen	&& Gosta_Estudar %is%	gsmaior	&& MachineLearning %is%	hcmed	, Classificacao %is%	alta	),
    fuzzy_rule( Domina_Python %is%	gemaior	&& Domina_R %is%	 rimed	&& AnaliseDeDados %is%	ecmed	&& Matematica %is%	plmed	&& Gosta_Estudar %is%	gsmaior	&& MachineLearning %is%	hcmaior	, Classificacao %is%	alta	),
    fuzzy_rule( Domina_Python %is%	gemaior	&& Domina_R %is%	 rimed	&& AnaliseDeDados %is%	ecmed	&& Matematica %is%	plmaior	&& Gosta_Estudar %is%	gsmaior	&& MachineLearning %is%	hcmaior	, Classificacao %is%	alta	),
    fuzzy_rule( Domina_Python %is%	gemed	&& Domina_R %is%	rimaior	&& AnaliseDeDados %is%	ecmen	&& Matematica %is%	plmaior	&& Gosta_Estudar %is%	gsmed	&& MachineLearning %is%	hcmaior	, Classificacao %is%	media	),
    fuzzy_rule( Domina_Python %is%	gemed	&& Domina_R %is%	rimaior	&& AnaliseDeDados %is%	ecmen	&& Matematica %is%	plmaior	&& Gosta_Estudar %is%	gsmed	&& MachineLearning %is%	hcmax	, Classificacao %is%	media	),
    fuzzy_rule( Domina_Python %is%	gemen	&& Domina_R %is%	rimax	&& AnaliseDeDados %is%	ecmin	&& Matematica %is%	plmax	&& Gosta_Estudar %is%	gsmed	&& MachineLearning %is%	hcmax	, Classificacao %is%	media	),
    fuzzy_rule( Domina_Python %is%	gemen	&& Domina_R %is%	rimax	&& AnaliseDeDados %is%	ecmin	&& Matematica %is%	plmax	&& Gosta_Estudar %is%	gsmen	&& MachineLearning %is%	hcmax	, Classificacao %is%	baixa	),
    fuzzy_rule( Domina_Python %is%	gemin	&& Domina_R %is%	rimax	&& AnaliseDeDados %is%	ecmin	&& Matematica %is%	plmax	&& Gosta_Estudar %is%	gsmen	&& MachineLearning %is%	hcmax	, Classificacao %is%	baixa	),
    fuzzy_rule( Domina_Python %is%	gemin	&& Domina_R %is%	rimax	&& AnaliseDeDados %is%	ecmin	&& Matematica %is%	plmax	&& Gosta_Estudar %is%	gsmin	&& MachineLearning %is%	hcmax	, Classificacao %is%	baixa	)
  )

sistema <- fuzzy_system(variaveis, regras)

ui <- fluidPage(theme = "bootstrap.css",
                
                titlePanel("Aderência DATA SCIENCE"),
                helpText("Modifique os valores e clique em processar"),
                
                fluidRow(
                  column(4,sliderInput("python", "Python",min = 5, max = 90,step = 10,value = 40)),
                  column(4,sliderInput("r", "R",min = 30, max = 85,step = 5,value = 50)),
                  column(4,sliderInput("analisedados", "Análise de dados",min = 10, max = 95,step = 5,value = 40))   
                ),
                fluidRow(
                  column(4,sliderInput("mat", "Matemática",min = 30, max = 95,step =5,value = 50)),
                  column(4,sliderInput("sestudar", "Gosta de Estudar",min = 20, max = 90,step = 10,value = 40)),
                  column(4,sliderInput("ml", "Machine Learning",min = 40, max = 75,step = 5,value = 50 ))
                ),
                fluidRow(
                  column(6,h1("Sistema:"), plotOutput("GrafSistema")),
                  column(6,actionButton("Processar","Processar"),
                         helpText("A Linha Vermelha Mostra a sua Aderência a Profissião de Cientista de Dados"),
                         plotOutput("GrafResultado")  
                  )
                )
)

server <- function(input, output) {
  
  output$GrafSistema <- renderPlot({ plot(sistema)  })
  observeEvent(input$Processar, {
    inferencia <- fuzzy_inference(sistema, list(Domina_Python  = input$python , Domina_R = input$r, AnaliseDeDados = input$analisedados, Matematica = input$mat,  Gosta_Estudar=input$sestudar, MachineLearning=input$ml ))
    output$GrafResultado <- renderPlot({ 
      
      plot(sistema$variables$Classificacao)
      lines(inferencia, col = "blue", lwd=4) 
    })
  })
}

shinyApp(ui = ui, server = server)
