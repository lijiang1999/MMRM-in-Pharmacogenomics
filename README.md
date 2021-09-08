# MMRM in Pharmacogenomics
Please cite the following work. 

## A Functional HTR1A Polymorphism, rs6295, Predicts Clinical Response to Lurasidone in Acutely Psychotic Patients with Schizophrenia 

## Akane Yoshikawa, M.D., Ph.D.1,2,3, Jiang Li, M.D., PhD1,3, and Herbert Y Meltzer, M.D.1

### 1 Department of Psychiatry and Behavioral Sciences, Northwestern Feinberg School of Medicine, Chicago IL, 60611, USA; 2 Schizophrenia project, Tokyo Metropolitan Institute of Medical Sciences, Tokyo, 156-8506, Japan; 3 These authors contributed equally to the work.

### This work was published in The Pharmacogenomics Journal 2020 Apr;20(2):260-270. doi: 10.1038/s41397-019-0101-5. 


#### Table 1. Demographic and Clinical characteristics of GWAS sample (n = 436) from three clinical trials of lurasidone in schizophrenic patients with European or African ancestry. 
![image](https://user-images.githubusercontent.com/13919508/132247439-2417f0e6-2f41-456d-b1dc-c7390e8e56f4.png)

###### Abbreviations: EUR, European-ancestry; AFR, African-ancestry; Psychopathological data was presented as mean ± SE. Clinical trials referred to three six-week randomized double-blind, placebo-controlled, multicenter registration trials of lurasidone (Loebel et al, 2013; Meltzer et al, 2011b; Nasrallah et al, 2013). PANSS five subscales, Positive, Negative, Disorganization, Excitement, Anxiety and Depression were based on the five-factor model of SCZ psychopathology (Levine and Rabinowitz, 2007).

#### Table 2. rs6295 (tagged by rs6449693or rs358532) contributes to trajectory of early response to lurasidone in SCZ patients with European ancestry from Pearl1,2 trial. 
![image](https://user-images.githubusercontent.com/13919508/132247534-d7d249cd-4523-4f2d-a82f-5fb3990b660e.png)

#### Figure 1. Boxplots of association between rs6295, tagged by rs6449693 (Pearl 1,2) or rs358532 (Pearl 3), and delta change in PANSS Total and five subscales in SCZ patients with European ancestry after six weeks of treatment with lurasidone in Pearl1,2 and Pearl3 trials. The Δ change or % change in PANSS Total and five subscales was calculated with last observation carried forward (LOCF). Δ change = PANSSLOCF6wk – PANSSBaseline. % change = Δ change/ PANSSBaseline × 100%.
![image](https://user-images.githubusercontent.com/13919508/132246894-b7842757-5c2d-4103-bacd-f529a78fbe49.png)
#### Figure 2.    Forest plots of the association between HTR1A functional polymorphism, rs6295, and improvement in PANSS negative symptom (2A) and positive symptom (2B) after treatment with antipsychotic drugs in patients with SCZ of European ancestry. This is a summary statistics of the meta-analyses of five independent datasets. 
![image](https://user-images.githubusercontent.com/13919508/132247022-54e3804d-bd62-47e5-a4be-2ded767ede05.png)
![image](https://user-images.githubusercontent.com/13919508/132247751-014df7dd-b2ee-4dc0-9e7a-d487b1d6d353.png)

#### Figure 3. Biological relevance
![image](https://user-images.githubusercontent.com/13919508/132247098-d2ce01e3-3f09-4e55-8a17-aa4be7132d6a.png)

#### Supplementary Figure 1. Margin plot of week 2 (wk2) or week 3 (wk3) versus week 6 (wk6) for PANSS Total as drawn by the marginplot() function in the VIM package. Observed data in blue, missing data in red. 
##### In Pearl 1&2, these distributions (wk2 verse wk6 or wk3 verse wk 6 in PANSS Total) were expected to be similar under missing at random.
![image](https://user-images.githubusercontent.com/13919508/132248121-79303eee-b218-4533-ab2e-78efa20ccc0e.png)
##### In Pearl 3, these distributions (wk2 verse wk6 or wk3 verse wk 6 in PANSS Total) were not similar suggesting that missing was not random for repeated measures.
![image](https://user-images.githubusercontent.com/13919508/132248148-7a62c1a6-bc6c-4cc5-b442-27861449880c.png)

#### Association analyses by Mixed Model Repeated Measures  
##### Multilevel multiple imputation is considered as a better approach for behavioral science data due to its flexibility to tailor the missing data handling procedure to match a specific set of analysis goals (https://stefvanbuuren.name/fimd/). Here we integrate R mice and lmer packages by conducting imputation, analysis by mixed-effects model, and pooling of the result by “Rubin’s rules”, to determine the association of the candidate genetic variant, rs6449693, and dynamic change of PANSS TOT or five domains for up to six weeks. The imputation method (meth) was a two-level normal model, '2l.norm', which could recover the intra-class correlation quite well, even for severe missing at random (MAR) cases and high amounts of missing data in the outcome or the predictor (Van Buuren 2011 Journal of Statistical Software 45(3)). We specified all predictors (rs6449693, PC1, PC2, PC3, gender, dose, time, baseline) as random effects. Patient ID (FID) was the class variable for ‘2l.norm’. The next step was to fit a linear model, ‘PANSS ~ rs6449693(recessive) + PC1 + PC2 + PC3 + gender + dose + (1+1|time))’ to each imputed dataset, and then to pool the results together. time was grouping factor and ‘1 + 1|time’ was random intercept with fixed mean. The rest of other variables in this model were fixed factors. According to the margin plot of wk2 versus wk6 data (e.g. PANSS Total) as  drawn by the marginplot() function in R VIM package, There were different distributions of missing and observed data from pearl 3 but not pearl 1&2 (Supplementary Figure 1), suggesting that the missing for repeated measures in pearl 3 data was not completely random. We only apply this two-level model to imputation of missing data from pearl 2 trial.
##### Alternatively, we conducted imputation, analysis by mixed-effects model, and pooling of the result to determine the association of the candidate genetic variant, rs6449693, and dynamic change of PANSS TOT or five domains for up to six weeks in pearl 1&2 dataset. According to Table 2B, rs6449693, a tag SNP of rs6295, was significantly associated with the dynamic change of PANSS Negative (original p = 0.005), which survived the Bonferroni correction. The negative value for the estimated fixed effect of rs6449693 indicated that the minor allele carriers (recessive mode of inheritance) showed a worse response to treatment with lurasidone comparing to those homozygous for major alleles.  The trend of association with the same direction for minor allele was also observed in PANSS Total and other domains such as Positive, and Disorganization in pearl 1&2 dataset. 

##### Table 2B. Association of rs6449693, a tag SNP of rs6295, with the dynamic change of PANSS Total and five domains by a linear mixed model of repeated measures for up to 6 weeks from Pearl 1 &2 trial. The syntax for imputation was ‘mice(long_format, meth = c("","","","","","","","","","2l.norm"), pred = pred, maxit=20, m = 10)’. The number (m) of imputed datasets was setup as 10. The number (maxit) of iterations for each imputation was setup as 20 so that the imputations for variable(s) reach convergence. The imputation method (meth) was a two-level normal model, '2l.norm'. We specified all predictors (rs6449693, PC1, PC2, PC3, gender, dose, time, baseline) as random effects. Patient ID (FID) was the class variable for ‘2l.norm’. The next step was to fit a linear model, ‘PANSS ~ rs6449693 + PC1 + PC2 + PC3 + gender + dose + (1+1|time))’ to each imputed dataset, and then to pool the results together. time was grouping factor and ‘1 + 1|time’ was random intercept with fixed mean. The rest of other variables in this model were fixed factors. 

![image](https://user-images.githubusercontent.com/13919508/132248266-4e7423c4-bc5a-44b3-923e-7f5b2181947d.png)

![image](https://user-images.githubusercontent.com/13919508/132270872-59c6fc39-897b-4b0d-96a0-7892dec98beb.png)
![image](https://user-images.githubusercontent.com/13919508/132270889-23e58506-4ffd-48c0-8ed6-b9d52f750976.png)
