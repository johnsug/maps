
library(leaflet)
library(data.table)

d <- fread("https://raw.githubusercontent.com/johnsug/maps/master/data.csv")

d[, .N, by=Comment]

leaflet(d) %>% 
  addTiles() %>% 
  addProviderTiles(providers$CartoDB.Positron) %>%
  addCircleMarkers(data=d[Comment=="Residence"], ~Long, ~Lat, radius=10, stroke=F, color="blue") %>%
  addCircleMarkers(data=d[Comment=="Residence"], ~Long, ~Lat, radius=3, fillOpacity=0.5, stroke=F, color="blue") %>%
  addCircleMarkers(data=d[Comment %in% c("Visit", "Interview")], ~Long, ~Lat, radius=3, stroke=F, fillOpacity=0.5, color="red") %>%
  addCircleMarkers(data=d[Comment=="Airport"], ~Long, ~Lat, radius=3, fillOpacity=0.5, stroke=F, color="orange")
