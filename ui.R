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
                                plotOutput('myIris'),
                                h4('The Random forest prediciton algorightm has the following accuracy(%):'),
                                verbatimTextOutput("model_accuracy"),
                                h4('The parameters you chose gave a prediction of:'),
                                verbatimTextOutput("predicted_species")
                            )
                        )
                    ),
               tabPanel("help",
                        h2('General'),
                        h5('This application uses the Iris dataset, plots it on the screen using a pairs chart; allows the user to define an iris flower with specific characteristics and predicts what species the flower will be'),
                        h5('It splits the original Iris dataset into a training set with 70% of the data, and a test set with the remaining 30%. The prediction algorithm is the random forest algorithm.'),
                        h5('The resulting blue cross on the chart is the new flower according to the user specification.'),
                        h2('Left panel with the sliders, checkbox and submit'),
                        h5('The sliders allow you to change the parameters of the iris flower'),
                        h5('The color checkbox will allow to separate the iris species by color'),
                        h2('Right panel'),
                        h5('This panel displays a pairs chart in color/black and blue according to the checkbox selection'),
                        h5('It also shows the accuracy of the prediction model and the resulting species of flower predicted by the model based on the user characteristics')
                )
    )
))
