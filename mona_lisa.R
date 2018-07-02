# Point to the location of image magick folder (portable version). Example:

OSName = Sys.info()['sysname']
if(a=="Windows") {
  Sys.setenv(PATH = paste("C:/Program Files/ImageMagick-7.0.8-3-portable-Q16-x64",
                        Sys.getenv("PATH"), sep = ";"))
}
else if(a=="Linux") {
  Sys.setenv(PATH=paste("/ImageMagick-7.0.8-3", Sys.getenv("PATH"), sep=";"))
}

library(LaF)
library(dplyr)
library(rjson)
library(gganimate)
library(ggplot2)

parse_drawing = function(list)
{
  lapply(list$drawing, function(z) {data_frame(x=z[[1]], y=z[[2]])}) %>% 
    bind_rows(.id = "line") %>% mutate(drawing=list$key_id, row_id=row_number())
}

data_to_plot = function(ndrawings) 
{
  ndjson_lines=sample_lines("The Mona Lisa.ndjson", ndrawings)
  lapply(ndjson_lines, function(x) {fromJSON(x) %>% 
      parse_drawing}) %>% bind_rows()
}

#############################################################################
# Single drawing (be careful to choose data_to_plot(1))
#############################################################################
ggplot(data_to_plot(1), aes(x, y)) +
  geom_path(aes(group = line), lwd=1)+
  scale_x_continuous(limits=c(0, 255))+
  scale_y_reverse(limits=c(255, 0))+
  theme_void()+
  coord_fixed()+
  theme(legend.position="none") -> plot
plot
# Do you like it? Save it!
ggsave("mona_single.png", dpi=600, width = 5, height = 5)

#############################################################################
# Mosaic
#############################################################################
ggplot(data_to_plot(9), aes(x, y)) +
  geom_path(aes(group = line), lwd=1)+
  scale_x_continuous(limits=c(0, 255))+
  scale_y_reverse(limits=c(255, 0))+
  theme_void()+
  coord_fixed()+
  theme(strip.text = element_blank())+
  theme(legend.position="none") +
  facet_wrap( ~ drawing, ncol=3) -> plot
plot
# Do you like it? Save it!
ggsave("mona_mosaic.png", dpi=600, width = 5, height = 5)

#############################################################################
# Animation (be careful to choose data_to_plot(1))
#############################################################################
ggplot(data_to_plot(1), aes(x, y, cumulative = TRUE, frame = row_id)) +
  geom_path(aes(group = line), lwd=1)+
  scale_x_continuous(limits=c(0, 255))+
  scale_y_reverse(limits=c(255, 0))+
  theme_void()+
  coord_fixed()+
  theme(legend.position="none") -> plot
# Do you like it? Save it!
gganimate(plot, title_frame=FALSE, "mona_animation.gif", interval = 0.1)

