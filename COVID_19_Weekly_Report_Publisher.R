library(rmarkdown)

#Set Report Publishing Date
publishing_date <- "20220516"





#Filepath to Report Editor
covid_report_filepath = paste0("C:/Users/ccross/Documents/Projects/COVID-19-Weekly-Report/COVID_19_Weekly_Report_Editor.Rmd")


#Filepath to Report Repository
report_repo_filepath = paste0("C:/Users/ccross/Documents/Projects/COVID-19-Weekly-Report/Report_Repository")


#Filepath to Active GitHub Pages
github_pages_filepath = paste0("C:/Users/ccross/Documents/Projects/COVID-19-Weekly-Report/docs")








#Render to Report Repository
rmarkdown::render(covid_report_filepath,
                  output_file = paste0("COVID_19_Weekly_Report_", publishing_date),
                  output_dir = report_repo_filepath)




#Render to GitHub Pages
rmarkdown::render(covid_report_filepath,
                  output_file = "index.html",
                  output_dir = github_pages_filepath)