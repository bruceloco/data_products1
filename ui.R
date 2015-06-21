shinyUI(fluidPage(
    navbarPage("Iris plant prediction and visualization",
               tabPanel("home",
                        sidebarLayout(
                            sidebarPanel(
                                h3('Iris plant characteristics'),
                                sliderInput('SepWidth', 'Sepal Width',value = mean(iris$Sepal.Width), min = min(iris$Sepal.Width), max(iris$Sepal.Width), step = 0.1),
                                sliderInput('SepLength', 'Sepal Length',value = mean(iris$Sepal.Length), min = min(iris$Sepal.Length), max(iris$Sepal.Length), step = 0.1),
                                sliderInput('PetWidth', 'Petal Width',value = mean(iris$Petal.Width), min = min(iris$Petal.Width), max(iris$Petal.Width), step = 0.1),
                                sliderInput('PetLength', 'Petal Length',value = mean(iris$Petal.Length), min = min(iris$Petal.Length), max(iris$Petal.Length), step = 0.1),
                                checkboxGroupInput("colorSpecies","Separate by color", c("Color Display" = "0")),
                                submitButton('Submit')
                            ),
                            mainPanel(
                                plotOutput('myIris')
                            )
                        )
                    ),
               tabPanel("help",
                        h2('General'),
                        h5('This application uses the Iris dataset, plots it on the screen using a pairs chart; allows the user to define an iris flower with specific characteristics and predicts what species the flower will be'),
                        h5('The resulting blue cross on the chart is the new flower according to the user specification.'),
                        h5('The screen is not updated untill the submit button is pushed.'),
                        h2('Left panel with the sliders, checkbox and submit'),
                        h5('The sliders allow you to change the parameters of the iris flower'),
                        h5('The color checkbox will allow to separate the iris species by color'),
                        h2('Right panel'),
                        h5('This panel displays a pairs chart in color/black and blue according to the checkbox selection'),
                        h5('The blue cross is the user choice')
               )
        )
))
