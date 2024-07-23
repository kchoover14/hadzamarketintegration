library(ggplot2); library(ggpubr)

#read file
hadza = read.csv("3-data-hadza-final.csv", stringsAsFactors = TRUE)

#data distribution
tiff('2-dataDistribution.tiff', res = 300, width = 10, height = 5, units = 'in', type="cairo")
ggplot(hadza, aes(birthCohort, hypoplasiaFrequency, color = Sex, shape=Sex)) +
  geom_jitter(width = .3, height = .3) +
  labs(title = "", x="Before 1975 or 1975+", y="Hypoplasia Frequency") +
   theme(legend.title = element_blank(),
    legend.text = element_text(color="black", size=14),
    axis.text.x = element_text(color = "black", size = 14),
    axis.text.y = element_text(color = "black", size = 14),
    axis.title.y=element_blank())+
  scale_y_continuous(limits=c(0, 2.5)) +
  scale_colour_viridis_d(begin= 0.15, end=0.65) +
  theme_classic() +
  theme(legend.position = "top", panel.border = element_rect(color = "black",fill = NA,size = 1))
dev.off()

# Time Series Plot and Correlation
tiff("3-timeSeries.tiff", width = 12, height = 4, units = "in", res = 300, type="cairo")
ggplot(hadza, aes(x = yob, y = hypoplasiaFrequency,fill= Sex, colour=Sex, shape=Sex)) +
    stat_smooth(method = "lm") +
    geom_point(size=2) +
    xlab("Year of Birth") + ylab("Hypoplasia Frequency") +
    stat_cor(aes(label = paste(..rr.label.., ..p.label.., sep = "~`,`~")),
             method = "pearson",
             p.accuracy = 0.001, r.accuracy = 0.01,
             label.x = c(1930,1930), label.y = c(3, 3.2), size = 4) +
    stat_regline_equation(label.x = c(1950,1950), label.y = c(3, 3.2), size = 4) +
    scale_x_continuous(breaks=seq(1925,2000,5))+
    theme(legend.position = "top",
          legend.title = element_blank(),
          legend.text = element_text(color="black", size=14),
          axis.text.x = element_text(color = "black", size = 14),
          axis.text.y = element_text(color = "black", size = 14),
          axis.title.y=element_blank())+
    scale_color_viridis_d(begin= 0.15, end=0.65)+
    scale_fill_viridis_d(begin= 0.15, end=0.65) +
    theme_classic2()
dev.off()
