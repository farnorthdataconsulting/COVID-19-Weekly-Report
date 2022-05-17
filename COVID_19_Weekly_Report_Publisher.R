library(rmarkdown)

#Set Report Publishing Date
publishing_date <- "20220516"





#Filepath to Report Editor
covid_report_filepath = paste0("C:/Users/ccross/Documents/Projects/COVID-19-Weekly-Report/COVID_19_Weekly_Report_Editor.Rmd")


#Filepath to GitHub Report Repository
github_report_repo_filepath = paste0("C:/Users/ccross/Documents/Projects/COVID-19-Weekly-Report/Report_Repository")


#Filepath to DHSS Report Archive
dhss_report_archive_filepath = paste0("//Hssjnupubweb2/DATADHSSALASKAGOV/data/COVID/COVID_19_Flu_Weekly_Report/Weekly_Case_Report_Archive")


#Filepath to DHSS Report Archive
dhss_active_report_filepath = paste0("//Hssjnupubweb2/DATADHSSALASKAGOV/data/COVID/COVID_19_Flu_Weekly_Report/Active_Report")


#Filepath to Active GitHub Pages
github_pages_filepath = paste0("C:/Users/ccross/Documents/Projects/COVID-19-Weekly-Report/docs")








#Render to Github Report Repository
rmarkdown::render(covid_report_filepath,
                  output_file = paste0("COVID_19_Weekly_Report_", publishing_date),
                  output_dir = github_report_repo_filepath)



#Render to DHSS Report Repository
rmarkdown::render(covid_report_filepath,
                  output_file = paste0("COVID_19_Weekly_Report_", publishing_date),
                  output_dir = dhss_report_archive_filepath)



#Render to DHSS Active Report Folder
rmarkdown::render(covid_report_filepath,
                  output_file = "COVID_19_Flu_Weekly_Case_Active_Report",
                  output_dir = dhss_active_report_filepath)



#Render to GitHub Pages
rmarkdown::render(covid_report_filepath,
                  output_file = "index.html",
                  output_dir = github_pages_filepath)