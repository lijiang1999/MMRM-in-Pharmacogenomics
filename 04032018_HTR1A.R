setwd("C:/Users/jlu967.FSM/Desktop/HTR1A_04032018")
library(ggplot2)
library(tidyr) #install tidyr only, some functions not working
library(tidyverse)
library(dplyr)
#library(lattice)
#install.packages("directlabels", repo="http://r-forge.r-project.org")
#install.packages("quadprog")
#install.packages("proto")
#library(directlabels)
#library(proto)

##Examples
# create fake dataset with additional attributes - sex, sample, and temperature
x <- data.frame(
  values = c(runif(100, min = -2), runif(100), runif(100, max = 2), runif(100)),
  sex = rep(c('M', 'F'), each = 100),
  sample = rep(c('sample_a', 'sample_b'), each = 200),
  temperature = sample(c('15C', '25C', '30C', '42C'), 400, replace = TRUE)
)

# compare different sample populations across various temperatures
ggplot(x, aes(x = sample, y = values, fill = sex)) +
  geom_boxplot() +
  facet_wrap(~ temperature) +
  annotate(geom = "text", x=1, y=2, label= c("p = 0.01", "p = 0.05", "p = 0.37", "p = 0.58"), size = 3, color = "red") +
  geom_text(x=2, y=2, label="Box plot", size = 3)

data1 <- read.table("C:/Users/jlu967.FSM/Desktop/HTR1A_04032018/InfiniumOmni5Exome-4v1-3_A1_b144_rsids.txt", header = TRUE)
head(data1, 10)
data1_rs10503929 <- subset(data1, RsID == "rs10503929")  #a nonsynonymous SNP from NRG1
data1_rs10503929
#191912   exm694583 rs10503929
#1266906 kgp1880782 rs10503929
#3527177 rs10503929 rs10503929



#loading file with wide format
getwd() #[1] "C:/Users/jlu967.FSM/Desktop/HTR1A_04032018"
HTR1A <- read.table("C:/Users/jlu967.FSM/Desktop/HTR1A_04032018/sunovion_data_for_Jiang_imputesex_IIDchange_CEU_lurasidone_rs10503929_rs3924999_loading_binary.txt", fill = TRUE, header = TRUE, na.strings = c("", "NA", "-999"), stringsAsFactors = FALSE)
str(HTR1A)

HTR1A_long <- HTR1A %>%
  na.omit() %>%  #do not use na.rm()
  filter(FID != "23322602") %>%
  select(Clinical_trial, Genotype, deltaTOT, deltaPOS, deltaNEG, deltaDIS, deltaEXC, deltaAD) %>%
  gather(Phenotype, delta_change, -c(Clinical_trial, Genotype))

str(HTR1A_long)

ggplot(HTR1A_long, aes(x = Clinical_trial, y = delta_change, fill = Genotype)) +
  geom_boxplot() +
  #scale_y_continuous(limits = c(-30, 20)) +
  facet_wrap(~ Phenotype, scales = "free")

#this is the final version for plotting
dodge <- position_dodge(width = 0.8)
P <- ggplot(HTR1A_long, aes(x = Clinical_trial, y = delta_change, color = Genotype, fill = factor(Genotype))) +
  facet_wrap(~ Phenotype, nrow = 2, scales = "free") +
  geom_boxplot(fill = "white", outlier.colour = NA, position = dodge) +
  geom_point(alpha = 0.2, position = position_jitterdodge(dodge.width = 0.8), show.legend = FALSE) +
  annotate(geom = "text", x=1, y=40, label= c("p = 0.060", "p = 0.057", "p = 0.280", "p = 0.016", "p = 0.182", "p = 0.031"), size = 3, color = "black") +
  annotate(geom = "text", x=2, y=40, label= c("p = 0.072", "p = 0.398", "p = 0.038", "p = 0.257", "p = 0.038", "p = 0.074"), size = 3, color = "black")
P

###########################################################################################################################
HTR1A_long <- HTR1A %>%
  na.omit() %>%  #do not use na.rm()
  select(Clinical_trial, Genotype, percentTOT, percentPOS, percentNEG, percentDIS, percentEXC, percentAD) %>%
  gather(Phenotype, percent_change, -c(Clinical_trial, Genotype))

#this is the final version for plotting
dodge <- position_dodge(width = 0.8)
P <- ggplot(HTR1A_long, aes(x = Clinical_trial, y = percent_change, color = Genotype, fill = factor(Genotype))) +
  facet_wrap(~ Phenotype, nrow = 2, scales = "free") +
  geom_boxplot(fill = "white", outlier.colour = NA, position = dodge) +
  geom_point(alpha = 0.2, position = position_jitterdodge(dodge.width = 0.8), show.legend = FALSE) +
  annotate(geom = "text", x=1, y=60, label= c("p = 0.062", "p = 0.058", "p = 0.294", "p = 0.017", "p = 0.182", "p = 0.033"), size = 3, color = "black") +
  annotate(geom = "text", x=2, y=60, label= c("p = 0.095", "p = 0.340", "p = 0.057", "p = 0.210", "p = 0.052", "p = 0.112"), size = 3, color = "black")
P 

HTR1A_pearl12 <- subset(HTR1A, Clinical_trial == "PEARL1_2")
length(HTR1A_pearl12)
str(HTR1A_pearl12)
#percentTOT
model.1 = aov(percentTOT~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(percentTOT~Genotype_score+dose+gender+TOTBASE, data = HTR1A_pearl12)
summary(model.2)     # 0.330 0.5664
anova(model.1, model.2)
model.3 = aov(percentTOT~Genotype_score*dose+gender+TOTBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  #F-statistic: 2.582 on 4 and 165 DF,  p-value: 0.03913

TukeyHSD(aov(percentTOT ~ as.factor(Genotype_score), HTR1A_pearl12))

#percentPOS
model.1 = aov(percentPOS~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(percentPOS~Genotype_score+dose+gender+POSBASE, data = HTR1A_pearl12)
summary(model.2)   #0.453  0.502
anova(model.1, model.2)
model.3 = aov(percentPOS~Genotype_score*dose+gender+POSBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  #F-statistic: 1.203 on 4 and 165 DF,  p-value: 0.3115

TukeyHSD(aov(percentPOS ~ as.factor(Genotype_score), HTR1A_pearl12))

#percentNEG
model.1 = aov(percentNEG~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(percentNEG~Genotype_score+dose+gender+NEGBASE, data = HTR1A_pearl12)
summary(model.2)   #1.048 0.30748 
anova(model.1, model.2)
model.3 = aov(percentNEG~Genotype_score*dose+gender+NEGBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  #F-statistic:  3.49 on 4 and 165 DF,  p-value: 0.009155

TukeyHSD(aov(percentNEG ~ as.factor(Genotype_score), HTR1A_pearl12))
pairwise.t.test(HTR1A_pearl12$percentNEG, HTR1A_pearl12$Genotype_score, p.adj = "none")
pairwise.t.test(HTR1A_pearl12$percentNEG, HTR1A_pearl12$Genotype_score, p.adj = "holm")
pairwise.t.test(HTR1A_pearl12$percentNEG, HTR1A_pearl12$Genotype_score, p.adj = "BH")

#percentDIS
model.1 = aov(percentDIS~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(percentDIS~Genotype_score+dose+gender+DISBASE, data = HTR1A_pearl12)
summary(model.2)  #0.547  0.460
anova(model.1, model.2)
model.3 = aov(percentDIS~Genotype_score*dose+gender+DISBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  

TukeyHSD(aov(percentDIS ~ as.factor(Genotype_score), HTR1A_pearl12))

#percentAD
model.1 = aov(percentAD~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(percentAD~Genotype_score+dose+gender+ADBASE, data = HTR1A_pearl12)
summary(model.2)  #2.101 0.14914
anova(model.1, model.2)
model.3 = aov(percentAD~Genotype_score*dose+gender+ADBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2) 

TukeyHSD(aov(percentAD ~ as.factor(Genotype_score), HTR1A_pearl12))

#percentEXC
model.1 = aov(percentEXC~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(percentEXC~Genotype_score+dose+gender+EXCBASE, data = HTR1A_pearl12)
summary(model.2) #0.370   0.5440
anova(model.1, model.2)
model.3 = aov(percentEXC~Genotype_score*dose+gender+EXCBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2) 

TukeyHSD(aov(percentEXC ~ as.factor(Genotype_score), HTR1A_pearl12))

HTR1A_pearl3 <- subset(HTR1A, Clinical_trial == "PEARL3")
str(HTR1A_pearl3)
#percentTOT
model.1 = aov(percentTOT~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(percentTOT~Genotype_score+dose+gender+TOTBASE, data = HTR1A_pearl3)
summary(model.2)  #0.517 0.4737
anova(model.1, model.2)
model.3 = aov(percentTOT~Genotype_score*dose+gender+TOTBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  


#percentPOS
model.1 = aov(percentPOS~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(percentPOS~Genotype_score+dose+gender+POSBASE, data = HTR1A_pearl3)
summary(model.2)   #0.402 0.5277
anova(model.1, model.2)
model.3 = aov(percentPOS~Genotype_score*dose+gender+POSBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  #F-statistic: 1.754 on 4 and 95 DF,  p-value: 0.1446

#percentNEG
model.1 = aov(percentNEG~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(percentNEG~Genotype_score+dose+gender+NEGBASE, data = HTR1A_pearl3)
summary(model.2)  #0.115 0.7355
anova(model.1, model.2)
model.3 = aov(percentNEG~Genotype_score*dose+gender+NEGBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2) 

#percentDIS
model.1 = aov(percentDIS~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(percentDIS~Genotype_score+dose+gender+DISBASE, data = HTR1A_pearl3)
summary(model.2)  #1.175 0.2811
anova(model.1, model.2)
model.3 = aov(percentDIS~Genotype_score*dose+gender+DISBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  

#percentAD
model.1 = aov(percentAD~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(percentAD~Genotype_score+dose+gender+ADBASE, data = HTR1A_pearl3)
summary(model.2)  #0.646 0.42351
anova(model.1, model.2)
model.3 = aov(percentAD~Genotype_score*dose+gender+ADBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  

#percentEXC
model.1 = aov(percentEXC~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(percentEXC~Genotype_score+dose+gender+EXCBASE, data = HTR1A_pearl3)
summary(model.2)  # 0.049 0.8245
anova(model.1, model.2)
model.3 = aov(percentEXC~Genotype_score*dose+gender+EXCBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  


#############################################################################################################################################
#loading file with wide format
getwd() #[1] "C:/Users/jlu967.FSM/Desktop/HTR1A_04032018"
HTR1A <- read.table("C:/Users/jlu967.FSM/Desktop/HTR1A_04032018/sunovion_data_for_Jiang_imputesex_IIDchange_CEU_lurasidone_rs6449693_loading_binary_remove23322602.txt", fill = TRUE, header = TRUE, na.strings = c("", "NA", "-999"), stringsAsFactors = FALSE)
HTR1A <- read.table("C:/Users/jlu967.FSM/Desktop/HTR1A_04032018/sunovion_data_for_Jiang_imputesex_IIDchange_CEU_lurasidone_rs3924999_loading_binary.txt", fill = TRUE, header = TRUE, na.strings = c("", "NA", "-999"), stringsAsFactors = FALSE)
str(HTR1A)
HTR1A_23322602 <- subset(HTR1A, FID == "23322602")

HTR1A_long <- HTR1A %>%
  na.omit() %>%  #do not use na.rm()
  filter(FID != "23322602") %>%
  select(Clinical_trial, Genotype, deltaTOT, deltaPOS, deltaNEG, deltaDIS, deltaEXC, deltaAD) %>%
  gather(Phenotype, delta_change, -c(Clinical_trial, Genotype))

str(HTR1A_long)

ggplot(HTR1A_long, aes(x = Clinical_trial, y = delta_change, fill = Genotype)) +
  geom_boxplot() +
  #scale_y_continuous(limits = c(-30, 20)) +
  facet_wrap(~ Phenotype, scales = "free")

#this is the final version for plotting
dodge <- position_dodge(width = 0.8)
P <- ggplot(HTR1A_long, aes(x = Clinical_trial, y = delta_change, color = Genotype, fill = factor(Genotype))) +
  facet_wrap(~ Phenotype, nrow = 2, scales = "free") +
  geom_boxplot(fill = "white", outlier.colour = NA, position = dodge) +
  geom_point(alpha = 0.2, position = position_jitterdodge(dodge.width = 0.8), show.legend = FALSE) +
  annotate(geom = "text", x=1, y=40, label= c("p = 0.060", "p = 0.057", "p = 0.280", "p = 0.016", "p = 0.182", "p = 0.031"), size = 3, color = "black") +
  annotate(geom = "text", x=2, y=40, label= c("p = 0.072", "p = 0.398", "p = 0.038", "p = 0.257", "p = 0.038", "p = 0.074"), size = 3, color = "black")
P

###########################################################################################################################
HTR1A_long <- HTR1A %>%
  na.omit() %>%  #do not use na.rm()
  select(Clinical_trial, Genotype, percentTOT, percentPOS, percentNEG, percentDIS, percentEXC, percentAD) %>%
  gather(Phenotype, percent_change, -c(Clinical_trial, Genotype))

#this is the final version for plotting
dodge <- position_dodge(width = 0.8)
P <- ggplot(HTR1A_long, aes(x = Clinical_trial, y = percent_change, color = Genotype, fill = factor(Genotype))) +
  facet_wrap(~ Phenotype, nrow = 2, scales = "free") +
  geom_boxplot(fill = "white", outlier.colour = NA, position = dodge) +
  geom_point(alpha = 0.2, position = position_jitterdodge(dodge.width = 0.8), show.legend = FALSE) +
  annotate(geom = "text", x=1, y=60, label= c("p = 0.062", "p = 0.058", "p = 0.294", "p = 0.017", "p = 0.182", "p = 0.033"), size = 3, color = "black") +
  annotate(geom = "text", x=2, y=60, label= c("p = 0.095", "p = 0.340", "p = 0.057", "p = 0.210", "p = 0.052", "p = 0.112"), size = 3, color = "black")
P 
###########################################################################################################################
HTR1A_long <- HTR1A %>%
  na.omit() %>%  #do not use na.rm()
  select(Clinical_trial, Genotype, TOTBASE, POSBASE, NEGBASE, DISBASE, EXCBASE, ADBASE) %>%
  gather(Phenotype, PANSS_Baseline, -c(Clinical_trial, Genotype))


#this is the final version for plotting
dodge <- position_dodge(width = 0.8)
P <- ggplot(HTR1A_long, aes(x = Clinical_trial, y = PANSS_Baseline, color = Genotype, fill = factor(Genotype))) +
  facet_wrap(~ Phenotype, nrow = 2, scales = "free") +
  geom_boxplot(fill = "white", outlier.colour = NA, position = dodge) +
  geom_point(alpha = 0.2, position = position_jitterdodge(dodge.width = 0.8), show.legend = FALSE)

P 



###################################################################################################################

HTR1A_pearl12 <- subset(HTR1A, Clinical_trial == "PEARL1_2")
length(HTR1A_pearl12)
str(HTR1A_pearl12)
#percentTOT
model.1 = aov(percentTOT~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(percentTOT~Genotype_score+dose+gender+TOTBASE, data = HTR1A_pearl12)
summary(model.2)     # 4.632 0.0328
anova(model.1, model.2)
model.3 = aov(percentTOT~Genotype_score*dose+gender+TOTBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  #F-statistic: 2.582 on 4 and 165 DF,  p-value: 0.03913


#percentPOS
model.1 = aov(percentPOS~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(percentPOS~Genotype_score+dose+gender+POSBASE, data = HTR1A_pearl12)
summary(model.2)   #1.793  0.182
anova(model.1, model.2)
model.3 = aov(percentPOS~Genotype_score*dose+gender+POSBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  #F-statistic: 1.203 on 4 and 165 DF,  p-value: 0.3115

#percentNEG
model.1 = aov(percentNEG~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(percentNEG~Genotype_score+dose+gender+NEGBASE, data = HTR1A_pearl12)
summary(model.2)   #5.801 0.0171 
anova(model.1, model.2)
model.3 = aov(percentNEG~Genotype_score*dose+gender+NEGBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  #F-statistic:  3.49 on 4 and 165 DF,  p-value: 0.009155

#percentDIS
model.1 = aov(percentDIS~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(percentDIS~Genotype_score+dose+gender+DISBASE, data = HTR1A_pearl12)
summary(model.2)  #3.631 0.0584
anova(model.1, model.2)
model.3 = aov(percentDIS~Genotype_score*dose+gender+DISBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  #F-statistic: 1.435 on 4 and 165 DF,  p-value: 0.2247

#percentAD
model.1 = aov(percentAD~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(percentAD~Genotype_score+dose+gender+ADBASE, data = HTR1A_pearl12)
summary(model.2)  #3.529 0.0621
anova(model.1, model.2)
model.3 = aov(percentAD~Genotype_score*dose+gender+ADBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  #F-statistic:  4.21 on 4 and 165 DF,  p-value: 0.002847

#percentEXC
model.1 = aov(percentEXC~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(percentEXC~Genotype_score+dose+gender+EXCBASE, data = HTR1A_pearl12)
summary(model.2) #1.111   0.2935
anova(model.1, model.2)
model.3 = aov(percentEXC~Genotype_score*dose+gender+EXCBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  #F-statistic: 9.213 on 4 and 165 DF,  p-value: 9.613e-07

HTR1A_pearl3 <- subset(HTR1A, Clinical_trial == "PEARL3")
str(HTR1A_pearl3)
#percentTOT
model.1 = aov(percentTOT~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(percentTOT~Genotype_score+dose+gender+TOTBASE, data = HTR1A_pearl3)
summary(model.2)  #2.573 0.1120
anova(model.1, model.2)
model.3 = aov(percentTOT~Genotype_score*dose+gender+TOTBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  #F-statistic: 1.764 on 4 and 95 DF,  p-value: 0.1425


#percentPOS
model.1 = aov(percentPOS~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(percentPOS~Genotype_score+dose+gender+POSBASE, data = HTR1A_pearl3)
summary(model.2)   #3.890 0.0515
anova(model.1, model.2)
model.3 = aov(percentPOS~Genotype_score*dose+gender+POSBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  #F-statistic: 1.754 on 4 and 95 DF,  p-value: 0.1446

#percentNEG
model.1 = aov(percentNEG~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(percentNEG~Genotype_score+dose+gender+NEGBASE, data = HTR1A_pearl3)
summary(model.2)  #1.590 0.2104
anova(model.1, model.2)
model.3 = aov(percentNEG~Genotype_score*dose+gender+NEGBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2) #F-statistic: 1.297 on 4 and 95 DF,  p-value: 0.2768

#percentDIS
model.1 = aov(percentDIS~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(percentDIS~Genotype_score+dose+gender+DISBASE, data = HTR1A_pearl3)
summary(model.2)  #0.921  0.340
anova(model.1, model.2)
model.3 = aov(percentDIS~Genotype_score*dose+gender+DISBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  #F-statistic: 0.8722 on 4 and 95 DF,  p-value: 0.4837

#percentAD
model.1 = aov(percentAD~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(percentAD~Genotype_score+dose+gender+ADBASE, data = HTR1A_pearl3)
summary(model.2)  #2.845 0.09500
anova(model.1, model.2)
model.3 = aov(percentAD~Genotype_score*dose+gender+ADBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  #F-statistic: 4.004 on 4 and 95 DF,  p-value: 0.004795

#percentEXC
model.1 = aov(percentEXC~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(percentEXC~Genotype_score+dose+gender+EXCBASE, data = HTR1A_pearl3)
summary(model.2)  # 3.707 0.0572
anova(model.1, model.2)
model.3 = aov(percentEXC~Genotype_score*dose+gender+EXCBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)  #F-statistic: 3.057 on 4 and 95 DF,  p-value: 0.02039
##########################################################################################################################
HTR1A_pearl12 <- subset(HTR1A, Clinical_trial == "PEARL1_2")
length(HTR1A_pearl12)
str(HTR1A_pearl12)

#deltaTOT
model.1 = aov(deltaTOT~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(deltaTOT~Genotype_score+dose+gender+TOTBASE, data = HTR1A_pearl12)
summary(model.2) #4.763 0.0305
anova(model.1, model.2)
model.3 = aov(deltaTOT~Genotype_score*dose+gender+TOTBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)


#deltaPOS
model.1 = aov(deltaPOS~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(deltaPOS~Genotype_score+dose+gender+POSBASE, data = HTR1A_pearl12)
summary(model.2)  #1.792  0.182
anova(model.1, model.2)
model.3 = aov(deltaPOS~Genotype_score*dose+gender+POSBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#deltaNEG
model.1 = aov(deltaNEG~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(deltaNEG~Genotype_score+dose+gender+NEGBASE, data = HTR1A_pearl12)
summary(model.2)  # 5.913   0.0161
anova(model.1, model.2)
model.3 = aov(deltaNEG~Genotype_score*dose+gender+NEGBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#deltaDIS
model.1 = aov(deltaDIS~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(deltaDIS~Genotype_score+dose+gender+DISBASE, data = HTR1A_pearl12)
summary(model.2) #3.688 0.05652
anova(model.1, model.2)
model.3 = aov(deltaDIS~Genotype_score*dose+gender+DISBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#deltaAD
model.1 = aov(deltaAD~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(deltaAD~Genotype_score+dose+gender+ADBASE, data = HTR1A_pearl12)
summary(model.2)  #3.582 0.060165
anova(model.1, model.2)
model.3 = aov(deltaAD~Genotype_score*dose+gender+ADBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#deltaEXC
model.1 = aov(deltaEXC~Genotype_score+dose+gender, data = HTR1A_pearl12)
summary(model.1)
model.2 = aov(deltaEXC~Genotype_score+dose+gender+EXCBASE, data = HTR1A_pearl12)
summary(model.2)  #1.176   0.2798
anova(model.1, model.2)
model.3 = aov(deltaEXC~Genotype_score*dose+gender+EXCBASE, data = HTR1A_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

HTR1A_pearl3 <- subset(HTR1A, Clinical_trial == "PEARL3")

#deltaTOT
model.1 = aov(deltaTOT~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(deltaTOT~Genotype_score+dose+gender+TOTBASE, data = HTR1A_pearl3)
summary(model.2)  #3.269 0.0738
anova(model.1, model.2)
model.3 = aov(deltaTOT~Genotype_score*dose+gender+TOTBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)


#deltaPOS
model.1 = aov(deltaPOS~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(deltaPOS~Genotype_score+dose+gender+POSBASE, data = HTR1A_pearl3)
summary(model.2)  #4.437 0.0378
anova(model.1, model.2)
model.3 = aov(deltaPOS~Genotype_score*dose+gender+POSBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#deltaNEG
model.1 = aov(deltaNEG~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(deltaNEG~Genotype_score+dose+gender+NEGBASE, data = HTR1A_pearl3)
summary(model.2)  #1.302 0.25676
anova(model.1, model.2)
model.3 = aov(deltaNEG~Genotype_score*dose+gender+NEGBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#deltaDIS
model.1 = aov(deltaDIS~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(deltaDIS~Genotype_score+dose+gender+DISBASE, data = HTR1A_pearl3)
summary(model.2)  # 0.721  0.398
anova(model.1, model.2)
model.3 = aov(deltaDIS~Genotype_score*dose+gender+DISBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#deltaAD
model.1 = aov(deltaAD~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(deltaAD~Genotype_score+dose+gender+ADBASE, data = HTR1A_pearl3)
summary(model.2)  #3.307   0.0722 
anova(model.1, model.2)
model.3 = aov(deltaAD~Genotype_score*dose+gender+ADBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#deltaEXC
model.1 = aov(deltaEXC~Genotype_score+dose+gender, data = HTR1A_pearl3)
summary(model.1)
model.2 = aov(deltaEXC~Genotype_score+dose+gender+EXCBASE, data = HTR1A_pearl3)
summary(model.2)  #4.440 0.03777
anova(model.1, model.2)
model.3 = aov(deltaEXC~Genotype_score*dose+gender+EXCBASE, data = HTR1A_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

install.packages('beeswarm')
library('beeswarm')
##########################################################################################################################################################
#loading file with wide format
getwd() #[1] "C:/Users/jlu967.FSM/Desktop/HTR1A_04032018"
NRG1 <- read.table("C:/Users/jlu967.FSM/Desktop/HTR1A_04032018/sunovion_data_for_Jiang_imputesex_IIDchange_CEU_lurasidone_rs3924999_loading_binary.txt", fill = TRUE, header = TRUE, na.strings = c("", "NA", "-999"), stringsAsFactors = FALSE)
str(NRG1)
NRG1_23322602 <- subset(NRG1, FID == "23322602")

NRG1_long <- NRG1 %>%
  na.omit() %>%  #do not use na.rm()
  filter(FID != "23322602") %>%
  select(Clinical_trial, Genotype, deltaTOT, deltaPOS, deltaNEG, deltaDIS, deltaEXC, deltaAD) %>%
  gather(Phenotype, delta_change, -c(Clinical_trial, Genotype))

str(NRG1_long)

ggplot(NRG1_long, aes(x = Clinical_trial, y = delta_change, fill = Genotype)) +
  geom_boxplot() +
  #scale_y_continuous(limits = c(-30, 20)) +
  facet_wrap(~ Phenotype, scales = "free")

#this is the final version for plotting
dodge <- position_dodge(width = 0.8)
P <- ggplot(NRG1_long, aes(x = Clinical_trial, y = delta_change, color = Genotype, fill = factor(Genotype))) +
  facet_wrap(~ Phenotype, nrow = 2, scales = "free") +
  geom_boxplot(fill = "white", outlier.colour = NA, position = dodge) +
  geom_point(alpha = 0.2, position = position_jitterdodge(dodge.width = 0.8), show.legend = FALSE)

P 

NRG1_long <- NRG1 %>%
  na.omit() %>%  #do not use na.rm()
  select(Clinical_trial, Genotype, percentTOT, percentPOS, percentNEG, percentDIS, percentEXC, percentAD) %>%
  gather(Phenotype, percent_change, -c(Clinical_trial, Genotype))

#this is the final version for plotting
dodge <- position_dodge(width = 0.8)
P <- ggplot(NRG1_long, aes(x = Clinical_trial, y = percent_change, color = Genotype, fill = factor(Genotype))) +
  facet_wrap(~ Phenotype, nrow = 2, scales = "free") +
  geom_boxplot(fill = "white", outlier.colour = NA, position = dodge) +
  geom_point(alpha = 0.2, position = position_jitterdodge(dodge.width = 0.8), show.legend = FALSE)

P 

NRG1_long <- NRG1 %>%
  na.omit() %>%  #do not use na.rm()
  select(Clinical_trial, Genotype, TOTBASE, POSBASE, NEGBASE, DISBASE, EXCBASE, ADBASE) %>%
  gather(Phenotype, PANSS_Baseline, -c(Clinical_trial, Genotype))


#this is the final version for plotting
dodge <- position_dodge(width = 0.8)
P <- ggplot(NRG1_long, aes(x = Clinical_trial, y = PANSS_Baseline, color = Genotype, fill = factor(Genotype))) +
  facet_wrap(~ Phenotype, nrow = 2, scales = "free") +
  geom_boxplot(fill = "white", outlier.colour = NA, position = dodge) +
  geom_point(alpha = 0.2, position = position_jitterdodge(dodge.width = 0.8), show.legend = FALSE)

P 



###################################################################################################################

NRG1_pearl12 <- subset(NRG1, Clinical_trial == "PEARL1_2")

#deltaTOT
model.1 = aov(deltaTOT~Genotype_score+dose+gender, data = NRG1_pearl12)
summary(model.1)
model.2 = aov(deltaTOT~Genotype_score+dose+gender+TOTBASE, data = NRG1_pearl12)
summary(model.2)
anova(model.1, model.2)
model.3 = aov(deltaTOT~Genotype_score*dose+gender+TOTBASE, data = NRG1_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)


#deltaPOS
model.1 = aov(deltaPOS~Genotype_score+dose+gender, data = NRG1_pearl12)
summary(model.1)
model.2 = aov(deltaPOS~Genotype_score+dose+gender+POSBASE, data = NRG1_pearl12)
summary(model.2)
anova(model.1, model.2)
model.3 = aov(deltaPOS~Genotype_score*dose+gender+POSBASE, data = NRG1_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#deltaNEG
model.1 = aov(deltaNEG~Genotype_score+dose+gender, data = NRG1_pearl12)
summary(model.1)
model.2 = aov(deltaNEG~Genotype_score+dose+gender+NEGBASE, data = NRG1_pearl12)
summary(model.2)
anova(model.1, model.2)
model.3 = aov(deltaNEG~Genotype_score*dose+gender+NEGBASE, data = NRG1_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#deltaDIS
model.1 = aov(deltaDIS~Genotype_score+dose+gender, data = NRG1_pearl12)
summary(model.1)
model.2 = aov(deltaDIS~Genotype_score+dose+gender+DISBASE, data = NRG1_pearl12)
summary(model.2)
anova(model.1, model.2)
model.3 = aov(deltaDIS~Genotype_score*dose+gender+DISBASE, data = NRG1_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#deltaAD
model.1 = aov(deltaAD~Genotype_score+dose+gender, data = NRG1_pearl12)
summary(model.1)
model.2 = aov(deltaAD~Genotype_score+dose+gender+ADBASE, data = NRG1_pearl12)
summary(model.2)
anova(model.1, model.2)
model.3 = aov(deltaAD~Genotype_score*dose+gender+ADBASE, data = NRG1_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#deltaEXC
model.1 = aov(deltaEXC~Genotype_score+dose+gender, data = NRG1_pearl12)
summary(model.1)
model.2 = aov(deltaEXC~Genotype_score+dose+gender+EXCBASE, data = NRG1_pearl12)
summary(model.2)
anova(model.1, model.2)
model.3 = aov(deltaEXC~Genotype_score*dose+gender+EXCBASE, data = NRG1_pearl12)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

NRG1_pearl3 <- subset(NRG1, Clinical_trial == "PEARL3")

#deltaTOT
model.1 = aov(deltaTOT~Genotype_score+dose+gender, data = NRG1_pearl3)
summary(model.1)
model.2 = aov(deltaTOT~Genotype_score+dose+gender+TOTBASE, data = NRG1_pearl3)
summary(model.2)
anova(model.1, model.2)
model.3 = aov(deltaTOT~Genotype_score*dose+gender+TOTBASE, data = NRG1_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)


#deltaPOS
model.1 = aov(deltaPOS~Genotype_score+dose+gender, data = NRG1_pearl3)
summary(model.1)
model.2 = aov(deltaPOS~Genotype_score+dose+gender+POSBASE, data = NRG1_pearl3)
summary(model.2)
anova(model.1, model.2)
model.3 = aov(deltaPOS~Genotype_score*dose+gender+POSBASE, data = NRG1_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#deltaNEG
model.1 = aov(deltaNEG~Genotype_score+dose+gender, data = NRG1_pearl3)
summary(model.1)
model.2 = aov(deltaNEG~Genotype_score+dose+gender+NEGBASE, data = NRG1_pearl3)
summary(model.2)
anova(model.1, model.2)
model.3 = aov(deltaNEG~Genotype_score*dose+gender+NEGBASE, data = NRG1_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#deltaDIS
model.1 = aov(deltaDIS~Genotype_score+dose+gender, data = NRG1_pearl3)
summary(model.1)
model.2 = aov(deltaDIS~Genotype_score+dose+gender+DISBASE, data = NRG1_pearl3)
summary(model.2)
anova(model.1, model.2)
model.3 = aov(deltaDIS~Genotype_score*dose+gender+DISBASE, data = NRG1_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#deltaAD
model.1 = aov(deltaAD~Genotype_score+dose+gender, data = NRG1_pearl3)
summary(model.1)
model.2 = aov(deltaAD~Genotype_score+dose+gender+ADBASE, data = NRG1_pearl3)
summary(model.2)
anova(model.1, model.2)
model.3 = aov(deltaAD~Genotype_score*dose+gender+ADBASE, data = NRG1_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#deltaEXC
model.1 = aov(deltaEXC~Genotype_score+dose+gender, data = NRG1_pearl3)
summary(model.1)
model.2 = aov(deltaEXC~Genotype_score+dose+gender+EXCBASE, data = NRG1_pearl3)
summary(model.2)
anova(model.1, model.2)
model.3 = aov(deltaEXC~Genotype_score*dose+gender+EXCBASE, data = NRG1_pearl3)
summary(model.3)
anova(model.3, model.2)
summary.lm(model.1)
summary.lm(model.2)

#########################################################################################################################################################################

#loading file with wide format for Quetiapine
getwd() #[1] "C:/Users/jlu967.FSM/Desktop/HTR1A_04032018"
NRG1 <- read.table("C:/Users/jlu967.FSM/Desktop/HTR1A_04032018/NRG1_PCA_CEU_Quetiapine_pearl3_rs3924999.txt", fill = TRUE, header = TRUE, na.strings = c("", "NA", "-999"), stringsAsFactors = FALSE)
NRG1 <- read.csv("C:/Users/jlu967.FSM/Desktop/HTR1A_04032018/NRG1_PCA_CEU_Quetiapine_Olanzapine_pearl3_rs3924999.csv", fill = TRUE, header = TRUE, na.strings = c("", "NA", "-999"), stringsAsFactors = FALSE)

str(NRG1)
NRG1_23322602 <- subset(NRG1, FID == "23322602")

NRG1_long <- NRG1 %>%
  na.omit() %>%  #do not use na.rm()
  filter(FID != "23322602") %>%
  select(Clinical_trial, Genotype, deltaTOT, deltaPOS, deltaNEG, deltaDIS, deltaEXC, deltaAD) %>%
  gather(Phenotype, delta_change, -c(Clinical_trial, Genotype))

str(NRG1_long)

#this is the final version for plotting
dodge <- position_dodge(width = 0.8)
P <- ggplot(NRG1_long, aes(x = Clinical_trial, y = delta_change, color = Genotype, fill = factor(Genotype))) +
  facet_wrap(~ Phenotype, nrow = 2, scales = "free") +
  geom_boxplot(fill = "white", outlier.colour = NA, position = dodge) +
  geom_point(alpha = 0.2, position = position_jitterdodge(dodge.width = 0.8), show.legend = FALSE)

P 

NRG1_long <- NRG1 %>%
  na.omit() %>%  #do not use na.rm()
  select(Clinical_trial, Genotype, percentTOT, percentPOS, percentNEG, percentDIS, percentEXC, percentAD) %>%
  gather(Phenotype, percent_change, -c(Clinical_trial, Genotype))

#this is the final version for plotting
dodge <- position_dodge(width = 0.8)
P <- ggplot(NRG1_long, aes(x = Clinical_trial, y = percent_change, color = Genotype, fill = factor(Genotype))) +
  facet_wrap(~ Phenotype, nrow = 2, scales = "free") +
  geom_boxplot(fill = "white", outlier.colour = NA, position = dodge) +
  geom_point(alpha = 0.2, position = position_jitterdodge(dodge.width = 0.8), show.legend = FALSE)

P 

NRG1_long <- NRG1 %>%
  na.omit() %>%  #do not use na.rm()
  select(Clinical_trial, Genotype, TOTBASE, POSBASE, NEGBASE, DISBASE, EXCBASE, ADBASE) %>%
  gather(Phenotype, PANSS_Baseline, -c(Clinical_trial, Genotype))


#this is the final version for plotting
dodge <- position_dodge(width = 0.8)
P <- ggplot(NRG1_long, aes(x = Clinical_trial, y = PANSS_Baseline, color = Genotype, fill = factor(Genotype))) +
  facet_wrap(~ Phenotype, nrow = 2, scales = "free") +
  geom_boxplot(fill = "white", outlier.colour = NA, position = dodge) +
  geom_point(alpha = 0.2, position = position_jitterdodge(dodge.width = 0.8), show.legend = FALSE)

P 


##########################################################################################################################################################
getwd() #[1] "C:/Users/jlu967.FSM/Desktop/HTR1A_04032018"
HTR1A_WK2 <- read.table("C:/Users/jlu967.FSM/Desktop/HTR1A_04032018/Pheno_PCA_Caucasian_POS_early_wk2_binary.txt", fill = TRUE, header = TRUE, na.strings = c("", "NA", "-999"), stringsAsFactors = FALSE)
str(HTR1A_WK2)
HTR1A_WK2_long <- HTR1A_WK2 %>%
  na.omit() %>%  #do not use na.rm()
  select(Clinical_trial, Genotype, deltaTOT, deltaPOS, deltaNEG, deltaDIS, deltaEXC, deltaAD) %>%
  gather(Phenotype, delta_change, -c(Clinical_trial, Genotype))

str(HTR1A_WK2_long)

ggplot(HTR1A_WK2_long, aes(x = Clinical_trial, y = delta_change, fill = Genotype)) +
  geom_boxplot() +
  #scale_y_continuous(limits = c(-30, 20)) +
  facet_wrap(~ Phenotype, scales = "free")

#this is the final version for plotting
dodge <- position_dodge(width = 0.8)
P <- ggplot(HTR1A_WK2_long, aes(x = Clinical_trial, y = delta_change, color = Genotype, fill = factor(Genotype))) +
  facet_wrap(~ Phenotype, nrow = 2, scales = "free") +
  geom_boxplot(fill = "white", outlier.colour = NA, position = dodge) +
  geom_point(alpha = 0.2, position = position_jitterdodge(dodge.width = 0.8), show.legend = FALSE)

P 

HTR1A_WK2_long <- HTR1A_WK2 %>%
  na.omit() %>%  #do not use na.rm()
  select(Clinical_trial, Genotype, percentTOT, percentPOS, percentNEG, percentDIS, percentEXC, percentAD) %>%
  gather(Phenotype, percent_change, -c(Clinical_trial, Genotype))

#this is the final version for plotting
dodge <- position_dodge(width = 0.8)
P <- ggplot(HTR1A_WK2_long, aes(x = Clinical_trial, y = percent_change, color = Genotype, fill = factor(Genotype))) +
  facet_wrap(~ Phenotype, nrow = 2, scales = "free") +
  geom_boxplot(fill = "white", outlier.colour = NA, position = dodge) +
  geom_point(alpha = 0.2, position = position_jitterdodge(dodge.width = 0.8), show.legend = FALSE)

P 

HTR1A_WK2_long <- HTR1A_WK2 %>%
  na.omit() %>%  #do not use na.rm()
  select(Clinical_trial, Genotype, TOTBASE, POSBASE, NEGBASE, DISBASE, EXCBASE, ADBASE) %>%
  gather(Phenotype, PANSS_Baseline, -c(Clinical_trial, Genotype))


#this is the final version for plotting
dodge <- position_dodge(width = 0.8)
P <- ggplot(HTR1A_WK2_long, aes(x = Clinical_trial, y = PANSS_Baseline, color = Genotype, fill = factor(Genotype))) +
  facet_wrap(~ Phenotype, nrow = 2, scales = "free") +
  geom_boxplot(fill = "white", outlier.colour = NA, position = dodge) +
  geom_point(alpha = 0.2, position = position_jitterdodge(dodge.width = 0.8), show.legend = FALSE)

P 
###############################################################################################################################
str(HTR1A)
library(dplyr)
grouped <- group_by(HTR1A, Genotype, Clinical_trial)
summarise(grouped, mean = mean(deltaNEG), sd = sd(deltaNEG), total.count = n())
summarise(grouped, mean = mean(NEGBASE), sd = sd(NEGBASE), total.count = n())
summarise(grouped, mean = mean(NEG_WK6), sd = sd(NEG_WK6), total.count = n())
grouped <- group_by(HTR1A, Clinical_trial)
summarise(grouped, mean = mean(deltaNEG), sd = sd(deltaNEG), total.count = n())      


grouped <- group_by(HTR1A, Genotype, Clinical_trial)
summarise(grouped, mean = mean(deltaPOS), sd = sd(deltaPOS), total.count = n())
summarise(grouped, mean = mean(POSBASE), sd = sd(POSBASE), total.count = n())
summarise(grouped, mean = mean(POS_WK6), sd = sd(POS_WK6), total.count = n())
grouped <- group_by(HTR1A, Clinical_trial)
summarise(grouped, mean = mean(deltaPOS), sd = sd(deltaPOS), total.count = n())


################################################################################################################################

##http://www.metafor-project.org/doku.php/tips:assembling_data_smd

library(rmeta)
install.packages("metafor")
library(metafor)
#NEG
meta_analysis_file <- read.table("C:/Users/jlu967.FSM/Desktop/HTR1A_04032018/meta_analysis_file.txt", fill = TRUE, header = TRUE, na.strings = c("", "NA", "-999"), stringsAsFactors = FALSE)
str(meta_analysis_file)
dat1 <- escalc(measure="SMD", m1i=m1i, sd1i=sd1i, n1i=n1i,
               m2i=m2i, sd2i=sd2i, n2i=n2i, data=meta_analysis_file)
dat1
res1 <- rma(yi, vi, ai = tpos, bi = tneg, ci = cpos, di = cneg, data=dat1, method = "REML",  measure = "SMD")
res1
forest(res1, slab = meta_analysis_file$study, cex = 0.75, ilab = round(meta_analysis_file$weight, 2), ilab.xpos = res1$b - 1)
       #refline = res1$b)
### switch to bold font
par(cex=0.75, font=2)
text(-1.5, 7, "Author(s)", pos=1)
text(3, 7, "SMD [95% CI]", pos=1)
text(-0.5, 7, "Weight", pos=1)
text(1, 7, "Favours CC", pos=1)

forest(res1, xlim=c(-16, 6), at=log(c(0.05, 0.25, 1, 4)), atransf=exp,
       ilab=cbind(res1$tpos, res1$tneg, res1$cpos, res1$cneg),
       ilab.xpos=c(-9.5,-8,-6,-4.5), cex=0.75, ylim=c(-1, 27),
       order=order(dat.bcg$alloc), rows=c(3:4,9:15,20:23),
       xlab="SMD", mlab="", psize=1)

result.ormr <- rma(ai = tpos, bi = tneg, ci = cpos, di = cneg,
                   data = dat.bcg,
                   mods = dat.bcg[, "ablat"],
                   measure = "OR",
                   method = "DL")


##POS
meta_analysis_file <- read.table("C:/Users/jlu967.FSM/Desktop/HTR1A_04032018/meta_analysis_file_pos.txt", fill = TRUE, header = TRUE, na.strings = c("", "NA", "-999"), stringsAsFactors = FALSE)
str(meta_analysis_file)
dat1 <- escalc(measure="SMD", m1i=m1i, sd1i=sd1i, n1i=n1i,
               m2i=m2i, sd2i=sd2i, n2i=n2i, data=meta_analysis_file)
dat1
res1 <- rma(yi, vi, ai = tpos, bi = tneg, ci = cpos, di = cneg, data=dat1, method = "REML",  measure = "SMD")
res1
forest(res1, slab = meta_analysis_file$study, cex = 0.85, ilab = round(meta_analysis_file$weight, 2), ilab.xpos = res1$b - 1.5)
#refline = res1$b)
### switch to bold font
par(cex=0.75, font=2)
text(-2.5, 7, "Author(s)", pos=1)
text(3.2, 7, "SMD [95% CI]", pos=1)
text(-1.2, 7, "Weight", pos=1)
text(0.5, 7, "Favours CC", pos=1)
