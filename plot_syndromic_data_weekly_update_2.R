# Make figure for weekly report illustrating trends in COVID-like illness and influenza-like illness

library(lubridate)
library(dplyr)

setwd("C:/Weekly Report/Weekly Case Update/Syndromic Data")

# the code assumes that the date variable is in the format M/D/YYYY; it may be easiest to change the format to this in the CSV

cli_ili_data<-read.csv(file = "C:/Weekly Report/Weekly Case Update/Syndromic Data/CLI and ILI_8.csv")

#Rename Date Field
cli_ili_data <- rename(cli_ili_data, Date = ï..Date)

cli_ili_data$Date<-as.Date(cli_ili_data$Date, format = "%m/%d/%Y") # make the date variable into a date

cli_ili_data<-cli_ili_data[order(cli_ili_data$Date),]

# dates correspond to the Sunday that begins each epi week
# therefore, shift 3 days forward so each data point is centered at the midpoint of the corresponding week (on the Wednesday)
cli_ili_data$Date<-cli_ili_data$Date + 3

# restrict to only use the past 52 weeks of data
cli_ili_data<-cli_ili_data[(nrow(cli_ili_data)-51):nrow(cli_ili_data),]

# plot the data

jpeg(file = paste("./weekly_cli_ili_plot_",Sys.Date(),".jpeg",sep = ""), width = 7.5, height = 4.5, pointsize = 11, units = "in", res = 200)
par(mar=c(8,5,0.7,0.5))

matplot(x = cli_ili_data$Date, y = cli_ili_data[,c("CLI","ILI")], col = c("orange","blue"),ylab = "percentage of visits",lwd = 2, xlab = NA, type = "l", lty = 1, xaxt = "n", ylim = c(0,max(cli_ili_data[,c("CLI","ILI")])*1.05), yaxs = "i")

# plot tick marks for the first day of each month on the x axis
start_date<-cli_ili_data$Date[1]
end_date<-rev(cli_ili_data$Date)[1]
start_month<-floor_date(x = start_date, unit = "month")
end_month<-ceiling_date(x = end_date, unit = "month")
month_series<-seq(from = start_month, to = end_month, by = "month")
axis(side = 1, at = month_series, labels = NA)

# label each month that is fully visible on the x axis
month_series_plotted<-month_series[which(month_series>=par("usr")[1] & month_series<=par("usr")[2])] # get the days for which ticks are shown
month_names<-paste(months(month_series_plotted), format(month_series_plotted, format = "%Y"))[1:(length(month_series_plotted)-1)] # get the labels for the months that are fully shown (so not including the last tick mark)
axis(side = 1, at = month_series_plotted[1:(length(month_series_plotted)-1)]+15, labels = month_names, tick = F, las = 3)

legend(x = "topleft", legend = c("COVID-like illness","influenza-like illness"), lwd = 2, col = c("orange","blue"))

dev.off()