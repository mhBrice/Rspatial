## World globe with plotly

# adapted from https://plot.ly/r/lines-on-maps/


library(plotly)

df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/globe_contours.csv')
df$id <- seq_len(nrow(df))

library(tidyr)
d <- df %>%
  gather(key, value, -id) %>%
  separate(key, c("l", "line"), "\\.") %>%
  spread(l, value)

geo <- list(
  showland = TRUE,
  showlakes = TRUE,
  showcountries = TRUE,
  showocean = TRUE,
  countrywidth = 0.5,
  landcolor = toRGB("grey45"),
  lakecolor = toRGB("#3EB3B3"),
  oceancolor = toRGB("#3EB3B3"),
  projection = list(
    type = 'orthographic',
    rotation = list(
      lon = -50,
      lat = 40,
      roll = -5
    )
  ),
  lonaxis = list(
    showgrid = TRUE,
    gridcolor = toRGB("grey80"),
    gridwidth = 0.5
  ),
  lataxis = list(
    showgrid = TRUE,
    gridcolor = toRGB("grey80"),
    gridwidth = 0.5
  )
)


p <- plot_geo(d) %>%
  layout(
    showlegend = FALSE, geo = geo
  ) %>% 
  layout(plot_bgcolor='#515151') %>% 
  layout(paper_bgcolor='#515151') #will also accept paper_bgcolor='black' or paper_bgcolor='transparent'

#Sys.setenv("plotly_username"="my_user_name")
#Sys.setenv("plotly_api_key"="api_key")

htmlwidgets::saveWidget(p, "globe.html")
plotly_IMAGE(p, width = 1000, height = 1000, scale=1,out_file = "img/globe.png")
