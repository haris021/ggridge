library(ggridges)
library(ggplot2)
library(viridis)
library(hrbrthemes)



#mohthtest <- read.csv("Peshawar_tmax.csv")
temp<- read.csv("Tmax_data.csv")


months <- c("December","November","October","September","August","July","June","May","April","March","February","January") ## need this string vector for sorting later
temp$months <- as.Date(temp$Date, format = "%d-%b-%y") %>%
  months() %>%
  as.factor() %>%
  factor(., levels = months)
#scales
mins <- min(temp$Min.TemperatureF)
maxs <- max(temp$Max.TemperatureF)

# Plot
ggplot(temp, aes(x = Tmax, y = months, fill = ..x..)) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01, gradient_lwd = 1.) +
  scale_x_continuous(expand = c(0.01, 0)) +
  scale_y_discrete(expand = c(0.01, 0)) +
  scale_fill_viridis(name = "Temp. [ºC]", option = "C") +
  labs(title = 'Temperatures in DIKhan 2020',
       #subtitle = 'Mean temperatures (Fahrenheit) by month for 2016\nData: Original CSV from the Weather Underground', 
       x = "Max Temperature") +
  theme_ridges(font_size = 13, grid = TRUE) + theme(axis.title.y = element_blank())
ggsave("DIKHan_2.jpeg",path="E:/scripts/gridge_plot/",device=jpeg, width = 10, height = 8, res=300)
