

test_data <- data.frame(coef1 =c(1.85, 1.86, 1.88, 1.45, 1.64, 1.54, 1.45, 1.64, 1.54, 1.45, 1.64),
                        coef2 =c(1.54, 1.45, 1.64, 1.54, 1.85, 1.86, 1.88, 5.85, 5.86, 5.88, 1.45),
                        coef3 =c(1.64, 1.54, 1.45, 1.64, 1.54, 1.45, 1.64, 1.54, 1.45, 1.64, 1.54),
                        low1  =c(1.45, 1.25, 1.30, 1.10, 1.20, 1.25, 1.15, 1.30, 1.15, 1.15, 1.30),
                        low2  =c(1.15, 1.15, 1.30, 1.15, 1.45, 1.25, 1.30, 3.45, 3.25, 3.30, 1.10),
                        low3  =c(1.20, 1.25, 1.10, 1.20, 1.25, 1.10, 1.20, 1.25, 1.10, 1.20, 1.25),
                        high1 =c(2.52, 2.10, 2.30, 2.54, 2.52, 2.25, 2.54, 2.52, 2.25, 2.54, 2.52),
                        high2 =c(2.25, 3.54, 3.52, 3.25, 2.52, 2.10, 2.30, 7.52, 7.10, 7.30, 2.54),
                        high3 =c(2.52, 2.25, 2.54, 2.52, 2.25, 2.54, 2.52, 2.25, 2.54, 2.52, 2.25))

tabletext<- c("Diabetes", "Heart disease", "Stroke", "COPD", "Asthma", 
              "Cancer", "Arthtitis", "Osteoporosis", "Depression", "Severe mental diseases", 
              "Dementia")


coef <- with(test_data, cbind(coef1, coef2, coef3))
low <- with(test_data, cbind(low1, low2, low3))
high <- with(test_data, cbind(high1, high2, high3))

library(forestplot)
forestplot(tabletext, coef, low, high,
           title="Comorbidities",
           zero= 1,
           lwd.zero = gpar(lwd=1),
           boxsize=0.18,
           line.margin = .1,
           xticks = c(0:8),
           clip=c(0, 8),
           fn.ci_norm = c(fpDrawNormalCI, fpDrawDiamondCI, fpDrawCircleCI),
           col=fpColors(box=c("darkblue", "darkred", "darkgreen"),
                        line=c("darkblue", "darkred", "darkgreen"),
                        zero = "black"),
           xlab="Odds ratio (95% CI)",
           new_page = TRUE,
           txt_gp = fpTxtGp(label = gpar(fontfamily = "Times New Roman", cex=1)),
           legend=c("Unadjusted", "Adjusted for Age and Sex", "Adjusted for all"))
           legend_args = fpLegend(title="Model Adjustment",
                       pos = "top",
                       r=unit(.2, "snpc"),
                       gp = gpar(col="black", fill= "white", lwd=0.7))
           
