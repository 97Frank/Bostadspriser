
# Define custom theme
theme_apple_pricing <- function() {
  theme_minimal() +
    theme(
      text = element_text(family = "Helvetica", color = "#333333"),
      plot.title = element_text(size = 28, face = "bold", hjust = 0.5),
      plot.subtitle = element_text(size = 18, hjust = 0.5),
      plot.caption = element_text(size = 12, hjust = 1),
      panel.background = element_rect(fill = "#f2f2f2", color = NA),
      panel.grid.major = element_line(size = 0.5, color = "#cccccc"),
      panel.grid.minor = element_blank(),
      axis.line = element_line(size = 0.5, color = "#333333"),
      axis.text = element_text(size = 12),
      axis.title = element_text(size = 14),
      legend.text = element_text(size = 12),
      legend.title = element_blank(),
      legend.key = element_blank(),
      legend.background = element_rect(fill = "lightgrey"),
      legend.direction = "horizontal",
      legend.position = c(.5,.95),
      plot.background = element_rect(fill = "#f2f2f2", color = NA),
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}


year_graph <- year_data %>% 
  filter(Area != "Stockholm") %>% 
  ggplot(aes(x = År, y = `kr/kvm`, color = Area)) +
  geom_line(aes(group = Area)) +
  geom_point()+
  labs(title="Housing Prices over Time",
       subtitle="By Area",
       x="Year",
       y="Price (SEK)") +
  theme_apple_pricing()



