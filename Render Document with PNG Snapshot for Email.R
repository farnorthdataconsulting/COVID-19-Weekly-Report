library(webshot2)




webshot(url = rmarkdown::render("C:/Users/ccross/Documents/Projects/COVID-19 Weekly Report R Markdown/COVID-19 Weekly Report.Rmd", 
                                output_format = "html_document",
                                output_options = list(toc=FALSE)),
        
        file = "webshot_test.png")

