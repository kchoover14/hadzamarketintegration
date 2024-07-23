library(tidyverse); library(psych); library(car)
library(ggplot2); library(ggpubr); library(gridBase); library(grid)

#read final data
hadza <- read.csv("3-data-hadza-final.csv", stringsAsFactors = TRUE)

#descriptives by sample
descriptivesSample <- describe(hadza, na.rm = TRUE)
write.csv(descriptivesSample, "results-descriptives.sample.csv", quote=FALSE, row.names = FALSE, na="")

#descriptives by sex
descriptivesSex <- describeBy(hadza, group="Sex", na.rm = TRUE, mat=TRUE)
write.csv(descriptivesSex, "results-descriptives.sex.csv", quote=FALSE, row.names = FALSE, na="")

#descriptives by cohort
descriptivesCohort <- describeBy(hadza, group="birthCohort", na.rm = TRUE, mat=TRUE)
write.csv(descriptivesCohort, "results-descriptivesCohort.csv", quote=FALSE, row.names = FALSE, na="")

#descriptives by sex and cohort
descriptivesSexCohort <- describeBy(hadza, group= c("Sex", "birthCohort"), na.rm = TRUE, mat=TRUE)
write.csv(descriptivesSexCohort, "results-descriptives.sexcohort.csv", quote=FALSE, row.names = FALSE, na="")

#Normal Testing
windows(width=5, height=2.5, xpinch = 300, ypinch = 300)
par(mfrow=c(1,2))
qqp(hadza$hypoplasiaFrequency, "norm", grid=FALSE, ylab=paste("Hypoplasia Frequency"),
    xlab=paste("Normal Distribution Quantiles"), envelope=c(style="lines"), cex=1.5,
    pch=16, col= "darkslateblue", col.lines="black", id=FALSE)
plot.new()
vps <- baseViewports()
pushViewport(vps$figure)
vp1 <-plotViewport(c(0,0,0,0))
print(p,vp = vp1)

#ttest for sex differences
t.test(hadza$hypoplasiaFrequency ~ hadza$Sex)

#tidy
rm(descriptivesCohort, descriptivesSample, descriptivesSex, descriptivesSexCohort, hadza, vp1, vps)
