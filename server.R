library(UsingR)

data(iris)

shinyServer(
    function(input, output) {
        output$myIris <- renderPlot({
            # take inputs from user to create prediction
             
            SepWidth <- input$SepWidth
            SepLength <- input$SepLength
            PetWidth <- input$PetWidth
            PetLength <- input$PetLength
            # define if we want color charts
            is_color <- input$colorSpecies
            # create data partition
            new_data<-data.frame( Sepal.Length=SepLength, Sepal.Width=SepWidth,Petal.Length=PetLength,Petal.Width=PetWidth)
            idx <- subset(expand.grid(x=1:4,y=1:4),x!=y)
            i <- 1
            if(!is.null(is_color))
            {
                pairs(iris[1:4],main="Iris Data", pch=19, col=as.numeric(iris$Species)+1,
                          panel=function(x, y,pch,col,...) {
                              points(x, y, pch=pch, col=col)
                              points(new_data[,idx[i,'x']],new_data[idx[i,'y']], cex=4,pch=10,col='blue')
                              i<<-i+1
                          }
                )
                mtext("Type of iris species: red-> setosa; green-> versicolor; blue-> virginica; blue cross-> user choice", 1, line=3.7,cex=.8)
            }
            else
            {
                pairs(iris[1:4],main="Iris Data", pch=19,
                      panel=function(x, y,pch,...) {
                          points(x, y, pch=pch)
                          points(new_data[,idx[i,'x']],new_data[idx[i,'y']], cex=4,pch=10,col='blue')
                          i<<-i+1
                      }
                )
                mtext("Type of iris species not distinguishible by color, blue cross-> user choice", 1, line=3.7,cex=.8)
            }
        })
        
    }
)