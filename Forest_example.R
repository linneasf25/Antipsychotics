

test_data <- data.frame(coef3 =c(1.64, 1.54, 1.45, 1.64, 1.54, 1.45, 1.64, 1.54, 1.45, 1.64, 1.54),
                        low3  =c(1.20, 1.25, 1.10, 1.20, 1.25, 1.10, 1.20, 1.25, 1.10, 1.20, 1.25),
                        high3 =c(2.52, 2.25, 2.54, 2.52, 2.25, 2.54, 2.52, 2.25, 2.54, 2.52, 2.25))

tabletext<- c("Diabetes", "Heart disease", "Stroke", "COPD", "Asthma", 
              "Cancer", "Arthtitis", "Osteoporosis", "Depression", "Severe mental diseases", 
              "Dementia")


coef <- with(test_data, coef3)
low <- with(test_data,  low3)
high <- with(test_data, high3)

library(forestplot)
forestplot(tabletext, coef, low, high,
           title="Comorbidities",
           zero= 1,
           lwd.zero = gpar(lwd=1),
           boxsize=0.18,
           line.margin = .1,
           xticks = c(0:8),
           clip=c(0, 8),
           fn.ci_norm =  fpDrawCircleCI,
           col=fpColors(box="darkgreen",
                        line= "black",
                        zero = "black"),
           xlab="Odds ratio (95% CI)",
           new_page = TRUE,
           txt_gp = fpTxtGp(label = list(gpar(fontfamily = "Arial",cex=1.1),
                                         xlab  = gpar(fontfamily = "Arial", cex=1.6),
                                         ticks = gpar(fontfamily = "Arial", cex=10),
                                         title = gpar(fontfamily = "Arial", cex=1.4))))
