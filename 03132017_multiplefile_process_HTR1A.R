
setwd("C:/Users/jlu967.FSM/Desktop/PLINK_250217_0110/HTR1A")

#This is code for making input file for HTR1A association testing on two SNPs using batch read files
filelist = list.files(pattern = ".assoc.linear")
filelist
inputfils <- lapply(filelist, read.table, header = T)
#names(inputfils)  <- sub("\\.frq", "", filelist) 
#str(inputfils)
#lapply(inputfils, names)
#length(inputfils)
fileraw = list.files(pattern = ".raw")
fileraw
inputfilsraw <- lapply(fileraw, read.table, header = T)
filebim = list.files(pattern = ".bim")
filebim
inputfilsbim <- lapply(filebim, read.table, header = F)

# start from the following change element in inputfils
df.data1 <- data.frame(inputfils[1])
head(df.data1, 10)
A1df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSAD_linear_covar12346-19_rs356562.assoc.linear", read.table, simplify = FALSE))
A2df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSAD_linear_covar12345-19_rs356562_dom.assoc.linear", read.table, simplify = FALSE))                                         
A3df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSAD_linear_covar12346-19_rs356562_rec.assoc.linear", read.table, simplify = FALSE))                                         
A4df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSAD_linear_covar12346-19_rs358532.assoc.linear", read.table, simplify = FALSE))                                             
A5df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSAD_linear_covar12346-19_rs358532_dom.assoc.linear", read.table, simplify = FALSE))                                         
A6df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSAD_linear_covar12346-19_rs358532_rec.assoc.linear", read.table, simplify = FALSE))                                         
A7df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSDIS_linear_covar12346-19_rs356562.assoc.linear", read.table, simplify = FALSE))                                            
A8df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSDIS_linear_covar12346-19_rs356562_dom.assoc.linear", read.table, simplify = FALSE))                                        
A9df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSDIS_linear_covar12346-19_rs356562_rec.assoc.linear", read.table, simplify = FALSE))                                        
A10df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSDIS_linear_covar12346-19_rs358532.assoc.linear", read.table, simplify = FALSE))                                            
A11df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSDIS_linear_covar12346-19_rs358532_dom.assoc.linear", read.table, simplify = FALSE))                                        
A12df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSDIS_linear_covar12346-19_rs358532_rec.assoc.linear", read.table, simplify = FALSE))                                        
A13df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSEXC_linear_covar12346-19_rs356562.assoc.linear", read.table, simplify = FALSE))                                            
A14df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSEXC_linear_covar12346-19_rs356562_dom.assoc.linear", read.table, simplify = FALSE))                                        
A15df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSEXC_linear_covar12346-19_rs356562_rec.assoc.linear", read.table, simplify = FALSE))                                        
A16df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSEXC_linear_covar12346-19_rs358532.assoc.linear", read.table, simplify = FALSE))                                            
A17df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSEXC_linear_covar12346-19_rs358532_dom.assoc.linear", read.table, simplify = FALSE))                                        
A18df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSEXC_linear_covar12346-19_rs358532_rec.assoc.linear", read.table, simplify = FALSE))                                        
A19df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSNEG_linear_covar12346-19_rs356562.assoc.linear", read.table, simplify = FALSE))                                            
A20df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSNEG_linear_covar12346-19_rs356562_dom.assoc.linear", read.table, simplify = FALSE))                                        
A21df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSNEG_linear_covar12346-19_rs356562_rec.assoc.linear", read.table, simplify = FALSE))                                        
A22df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSNEG_linear_covar12346-19_rs358532.assoc.linear", read.table, simplify = FALSE))                                            
A23df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSNEG_linear_covar12346-19_rs358532_dom.assoc.linear", read.table, simplify = FALSE))                                        
A24df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSNEG_linear_covar12346-19_rs358532_rec.assoc.linear", read.table, simplify = FALSE))                                        
A25df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSPOS_linear_covar12346-19_rs356562.assoc.linear", read.table, simplify = FALSE))                                            
A26df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSPOS_linear_covar12346-19_rs356562_dom.assoc.linear", read.table, simplify = FALSE))                                        
A27df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSPOS_linear_covar12346-19_rs356562_rec.assoc.linear", read.table, simplify = FALSE))                                        
A28df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSPOS_linear_covar12346-19_rs383532.assoc.linear", read.table, simplify = FALSE))                                            
A29df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSPOS_linear_covar12346-19_rs383532_dom.assoc.linear", read.table, simplify = FALSE))                                        
A30df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSPOS_linear_covar12346-19_rs383532_rec.assoc.linear", read.table, simplify = FALSE))                                        
A31df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSTOT_linear_covar12346-19_rs356562.assoc.linear", read.table, simplify = FALSE))                                            
A32df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSTOT_linear_covar12346-19_rs356562_dom.assoc.linear", read.table, simplify = FALSE))                                        
A33df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSTOT_linear_covar12346-19_rs356562_rec.assoc.linear", read.table, simplify = FALSE))                                        
A34df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSTOT_linear_covar12346-19_rs358532.assoc.linear", read.table, simplify = FALSE))                                            
A35df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSTOT_linear_covar12346-19_rs358532_dom.assoc.linear", read.table, simplify = FALSE))                                        
A36df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_10302014_perl12_PANSSTOT_linear_covar12346-19_rs358532_rec.assoc.linear", read.table, simplify = FALSE))                                        
A37df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSAD_takeda_delta_AD_LOCF_wk6_linear_covar12346-19_rs356562.assoc.linear", read.table, simplify = FALSE))            
A38df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSAD_takeda_delta_AD_LOCF_wk6_linear_covar12346-19_rs356562_dominant.assoc.linear", read.table, simplify = FALSE))   
A39df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSAD_takeda_delta_AD_LOCF_wk6_linear_covar12346-19_rs356562_rec.assoc.linear", read.table, simplify = FALSE))        
A40df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSAD_takeda_delta_AD_LOCF_wk6_linear_covar12346-19_rs358532.assoc.linear", read.table, simplify = FALSE))            
A41df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSAD_takeda_delta_AD_LOCF_wk6_linear_covar12346-19_rs358532_dominant.assoc.linear", read.table, simplify = FALSE))   
A42df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSAD_takeda_delta_AD_LOCF_wk6_linear_covar12346-19_rs358532_rec.assoc.linear", read.table, simplify = FALSE))        
A43df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSDIS_takeda_delta_DIS_LOCF_wk6_linear_covar12346-19_rs356562.assoc.linear", read.table, simplify = FALSE))          
A44df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSDIS_takeda_delta_DIS_LOCF_wk6_linear_covar12346-19_rs356562_dominant.assoc.linear", read.table, simplify = FALSE)) 
A45df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSDIS_takeda_delta_DIS_LOCF_wk6_linear_covar12346-19_rs356562_rec.assoc.linear", read.table, simplify = FALSE))      
A46df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSDIS_takeda_delta_DIS_LOCF_wk6_linear_covar12346-19_rs358532.assoc.linear", read.table, simplify = FALSE))          
A47df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSDIS_takeda_delta_DIS_LOCF_wk6_linear_covar12346-19_rs358532_dominant.assoc.linear", read.table, simplify = FALSE)) 
A48df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSDIS_takeda_delta_DIS_LOCF_wk6_linear_covar12346-19_rs358532_recessive.assoc.linear", read.table, simplify = FALSE))
A49df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSEXC_takeda_delta_EXC_LOCF_wk6_linear_covar12346-19_rs356562.assoc.linear", read.table, simplify = FALSE))          
A50df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSEXC_takeda_delta_EXC_LOCF_wk6_linear_covar12346-19_rs356562_dom.assoc.linear", read.table, simplify = FALSE))      
A51df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSEXC_takeda_delta_EXC_LOCF_wk6_linear_covar12346-19_rs356562_rec.assoc.linear", read.table, simplify = FALSE))      
A52df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSEXC_takeda_delta_EXC_LOCF_wk6_linear_covar12346-19_rs358532.assoc.linear", read.table, simplify = FALSE))          
A53df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSEXC_takeda_delta_EXC_LOCF_wk6_linear_covar12346-19_rs358532_dom.assoc.linear", read.table, simplify = FALSE))      
A54df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSEXC_takeda_delta_EXC_LOCF_wk6_linear_covar12346-19_rs358532_rec.assoc.linear", read.table, simplify = FALSE))      
A55df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSNEG_takeda_delta_NEG_LOCF_wk6_linear_covar12346-19_rs356562.assoc.linear", read.table, simplify = FALSE))          
A56df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSNEG_takeda_delta_NEG_LOCF_wk6_linear_covar12346-19_rs356562_dom.assoc.linear", read.table, simplify = FALSE))      
A57df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSNEG_takeda_delta_NEG_LOCF_wk6_linear_covar12346-19_rs356562_rec.assoc.linear", read.table, simplify = FALSE))      
A58df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSNEG_takeda_delta_NEG_LOCF_wk6_linear_covar12346-19_rs358532.assoc.linear", read.table, simplify = FALSE))          
A59df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSNEG_takeda_delta_NEG_LOCF_wk6_linear_covar12346-19_rs358532_dom.assoc.linear", read.table, simplify = FALSE))      
A60df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSNEG_takeda_delta_NEG_LOCF_wk6_linear_covar12346-19_rs358532_rec.assoc.linear", read.table, simplify = FALSE))      
A61df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSPOS_takeda_delta_TOT_LOCF_wk6_linear_covar12346-19_rs356562.assoc.linear", read.table, simplify = FALSE))          
A62df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSPOS_takeda_delta_TOT_LOCF_wk6_linear_covar12346-19_rs356562_dom.assoc.linear", read.table, simplify = FALSE))      
A63df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSPOS_takeda_delta_TOT_LOCF_wk6_linear_covar12346-19_rs356562_rec.assoc.linear", read.table, simplify = FALSE))      
A64df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSPOS_takeda_delta_TOT_LOCF_wk6_linear_covar12346-19_rs358532.assoc.linear", read.table, simplify = FALSE))          
A65df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSPOS_takeda_delta_TOT_LOCF_wk6_linear_covar12346-19_rs358532_dom.assoc.linear", read.table, simplify = FALSE))      
A66df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSPOS_takeda_delta_TOT_LOCF_wk6_linear_covar12346-19_rs358532_rec.assoc.linear", read.table, simplify = FALSE))      
A67df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSTOT_takeda_delta_TOT_LOCF_wk6_linear_covar12346-19_rs356562.assoc.linear", read.table, simplify = FALSE))          
A68df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSTOT_takeda_delta_TOT_LOCF_wk6_linear_covar12346-19_rs356562_dom.assoc.linear", read.table, simplify = FALSE))      
A69df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSTOT_takeda_delta_TOT_LOCF_wk6_linear_covar12346-19_rs356562_rec.assoc.linear", read.table, simplify = FALSE))      
A70df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSTOT_takeda_delta_TOT_LOCF_wk6_linear_covar12346-19_rs358532.assoc.linear", read.table, simplify = FALSE))          
A71df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSTOT_takeda_delta_TOT_LOCF_wk6_linear_covar12346-19_rs358532_dom.assoc.linear", read.table, simplify = FALSE))      
A72df.data.filename <- do.call("rbind", sapply("Takeda_PID15337_HumanOmni5Exome-4v1-1_12082014_CEU_lurasidone_PANSSTOT_takeda_delta_TOT_LOCF_wk6_linear_covar12346-19_rs358532_rec.assoc.linear", read.table, simplify = FALSE))      
data_final6 <- rbind(A71df.data.filename, A72df.data.filename, A69df.data.filename, A68df.data.filename, A67df.data.filename, A66df.data.filename, A65df.data.filename, A64df.data.filename, A63df.data.filename, A62df.data.filename, A61df.data.filename, A60df.data.filename)
data_final5 <- rbind(A59df.data.filename, A58df.data.filename, A57df.data.filename, A56df.data.filename, A55df.data.filename, A54df.data.filename, A53df.data.filename, A52df.data.filename, A51df.data.filename, A50df.data.filename)
data_final4 <- rbind(A49df.data.filename, A48df.data.filename, A47df.data.filename, A46df.data.filename, A45df.data.filename, A44df.data.filename, A43df.data.filename, A42df.data.filename, A41df.data.filename, A40df.data.filename)
data_final3 <- rbind(A39df.data.filename, A38df.data.filename, A37df.data.filename, A36df.data.filename, A35df.data.filename, A34df.data.filename, A33df.data.filename, A32df.data.filename, A31df.data.filename, A30df.data.filename)
data_final2 <- rbind(A29df.data.filename, A28df.data.filename, A27df.data.filename, A26df.data.filename, A25df.data.filename, A24df.data.filename, A23df.data.filename, A22df.data.filename, A21df.data.filename, A20df.data.filename)
data_final1 <- rbind(A19df.data.filename, A18df.data.filename, A17df.data.filename, A16df.data.filename, A15df.data.filename, A14df.data.filename, A13df.data.filename, A12df.data.filename, A11df.data.filename, A10df.data.filename)
data_final <- rbind(A9df.data.filename, A8df.data.filename, A7df.data.filename, A6df.data.filename, A5df.data.filename, A4df.data.filename, A3df.data.filename, A2df.data.filename, A1df.data.filename)
data_total <- rbind(data_final6, data_final5, data_final4, data_final3, data_final2, data_final1, data_final)
write.table(data_total, "C:/Users/jlu967.FSM/Desktop/PLINK_250217_0110/HTR1A_rs358532_rs356562.txt", quote=FALSE, row.names= TRUE, col.names=FALSE)











data2 <- data.frame(inputfilsraw[1]) #change []
df.data2 <-data.frame(data2[7:ncol(data2)])
df.data2.transpose <- t(df.data2)
head(df.data2.transpose)
data3 <-data.frame(inputfilsbim[1]) #change []
df.data3 <- data.frame(data3[,4])
colnames(df.data3) <- "bp"
head(df.data3, 10)
data_all <- cbind(df.data1, df.data2.transpose, df.data3)

head(data_all)
data_all_1 <- subset(data_all, select = c(CHR, SNP, bp, A2, A1, MAF))
#head(data_all_select, 10)
data_all_2 <- data_all[8:ncol(data_all)-1]
head(data_all_2)
data_final <- cbind(data_all_1, data_all_2)
head(data_final)
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr10.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr10.gz") # change chr
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

# replace NA with 0 in data frame
data_final[is.na(data_final)] <- 0
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr10_NA.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)  # change chr
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr10_NA.gz") # change chr
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)










df.data <- 0

lapply(inputfils, function(x){
  t <- paste("chr", as.character(inputfils$CHR), sep="")
  out <- function(t)
})
for (i in 1:length(inputfils)) {
  print(i)
  df.data[i] <- data.frame(inputfils[i])
  df.data[i]$CHR <- paste("chr", as.character(df.data[i]$CHR), sep="")
  out.file <- write.table(out.file, file = paste(filelist[i], "change", sep=""), row.names = FALSE, quote = FALSE)
}

# the following is the script for dosage file creation for PrediXcan

setwd("~/Desktop/PrediXcanExample")

#This is code for making PrediXcan input file for nonimputed file
data1 <- read.table("Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr6_geno_freq.frq", header = TRUE)
df.data1 <- data.frame(data1)
df.data1$CHR[df.data1$CHR == 6] <- "chr6"
head(df.data1, 10)
data2 <- read.table("Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr6_geno_recodeA.raw", header = TRUE)
df.data2 <-data.frame(data2[7:ncol(data2)])
df.data2.transpose <- t(df.data2)
head(df.data2.transpose)
data3 <- read.table("Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr6_geno.bim", header = FALSE)
df.data3 <- data.frame(data3[,4])
colnames(df.data3) <- "bp"
head(df.data3, 10)
data_all <- cbind(df.data1, df.data2.transpose, df.data3)
head(data_all)
data_all_1 <- subset(data_all, select = c(CHR, SNP, bp, A2, A1, MAF))
#head(data_all_select, 10)
data_all_2 <- data_all[8:ncol(data_all)-1]
head(data_all_2)
data_final <- cbind(data_all_1, data_all_2)
head(data_final)
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr6.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr6.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

# replace NA with 1 in data frame
data_final[is.na(data_final)] <- 1
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr6_NA1.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr6_NA1.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

#remove NA from genotype data
data11 <- read.table("~/Desktop/PrediXcanExample/genotype_file_chr6_NA.txt", header = FALSE)
df.data11 <- data.frame(data11)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr6.gz")
write.table(df.data11, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)


#remove NA from genotype data
data11 <- read.table("~/Desktop/PrediXcanExample/Meltzer_chr6_CEUonly_HLA.imputed_info", header = TRUE)
df.data11 <- data.frame(data11)
df.data11[,1] <- "chr6"
df.data11.subset <- subset(df.data11, select = c(snp_id, rs_id, position, a0, a1, exp_freq_a1))
head(df.data11.subset, 10)
data22 <- read.table("~/Desktop/PrediXcanExample/Meltzer_chr6_CEUonly_HLA.imputed", header = FALSE)
df.data22 <- data.frame(data22)
colnames(df.data22)[2] <- "rs_id"
df.data22.subset <- df.data22[,2:ncol(df.data22)]
head(df.data22.subset, 10)
#data_final <- cbind(df.data11.subset, df.data22.subset)
data_final <- merge(df.data11.subset, df.data22.subset, by="rs_id")
head(data_final, 5)
data_final_add <- data_final[, -c(7:9)]
data_final_add <- data_final_add[, c(2,1,3:ncol(data_final_add))]
head(data_final_add, 5)
write.table(data_final_add, "~/Desktop/PrediXcanExample/genotype_file_chr6_HLA_imputed.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
#make gz file
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr6_HLA_imputed.gz")
write.table(data_final_add, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)





setwd("~/Desktop/PrediXcanExample")
#process HLA region recodeA file (dosage) using imputed data
data11 <- read.table("~/Desktop/PrediXcanExample/Meltzer_chr6_CEUonly_HLA_recodeA_maf05_removelist_recodeA.raw", header = TRUE)
df.data11 <-data.frame(data11[7:ncol(data11)])
df.data11.transpose <- t(df.data11)
head(df.data11.transpose)
write.table(df.data11.transpose, "~/Desktop/PrediXcanExample/Meltzer_chr6_CEUonly_HLA_recodeA_maf05_transpose.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
#change NA into 0 or 1 or 2 (does not change the result very much)
df.data11.transpose.NA <- replace(df.data11.transpose, which(is.na(df.data11.transpose)),1)
write.table(df.data11.transpose.NA, "~/Desktop/PrediXcanExample/Meltzer_chr6_CEUonly_HLA_recodeA_maf05_transpose_NA_1.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)


#identify the duplicated SNPs and create duplicated SNPLIST
data44 <- read.table("~/Desktop/PrediXcanExample/Meltzer_chr6_CEUonly_HLA_recodeA_maf05.bim", header = FALSE)
df.data44 <- data.frame(data44)
df.data44.removedup <- df.data44[duplicated(df.data44[,2]),]
df.data44.removedup <- subset(df.data44.removedup, select = V2)
df.data44.removedup
write.table(df.data44.removedup, "~/Desktop/PrediXcanExample/Meltzer_chr6_CEUonly_HLA_recodeA_maf05_removelist.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)

#process impute.info file and remove duplicated SNPs
data22 <- read.table("~/Desktop/PrediXcanExample/Meltzer_chr6_CEUonly_HLA.imputed_info", header = TRUE)
df.data22 <- data.frame(data22)
colnames(df.data22)[2] <- "SNP"
df.data22[,1] <- "chr6"
df.data22.subset <- subset(df.data22, select = c(snp_id, SNP, position, a0, a1, exp_freq_a1))
head(df.data22.subset, 5)
#write.table(data_final, "~/Desktop/PrediXcanExample/Meltzer_chr6_CEUonly_HLA_recodeA_maf05_merged.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)

#df.data22.removedup <- df.data22.subset[duplicated(df.data22.subset[,2]),]
#df.data22.removedup <- subset(df.data22.removedup, select = c(SNP))
#df.data22.removedup
#df.data22.final <- df.data22.subset[df.data22.subset$SNP != df.data.removedup]


#process freq file
data33 <- read.table("~/Desktop/PrediXcanExample/Meltzer_chr6_CEUonly_HLA_recodeA_maf05_removelist_freq.frq", header = TRUE)
# merge frequecy file and impute.info file and sort the SNP by freq file and remove dup by excel. replace maf 
data_final <- merge(data33, df.data22.subset, by="SNP")
head(data_final, 5)
write.table(data_final, "~/Desktop/PrediXcanExample/Meltzer_chr6_CEUonly_HLA_recodeA_maf05_merged.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)

#read in proessed first portion of dosage file
data55 <- read.table("~/Desktop/PrediXcanExample/Meltzer_chr6_CEUonly_HLA_recodeA_maf05_freq_edited.txt", header = FALSE)
df.data55 <- data.frame(data55)
head(df.data55, 10)
#combine first and second portion of dosage file
data_all <- cbind(df.data55, df.data11.transpose.NA)
write.table(data_all, "~/Desktop/PrediXcanExample/Meltzer_chr6_CEUonly_HLA_recodeA_maf05_combined_NA1.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
#make gz file
gz1 <- gzfile("~/Desktop/PrediXcanExample/Meltzer_chr6_CEUonly_HLA_recodeA_maf05_combined_NA1.gz")
write.table(data_all, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

#The following is to process other chrs from Meltzer illumina data
setwd("~/Desktop/PrediXcanExample")

#This is code for making PrediXcan input file for nonimputed file
data1 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr7_geno_freq.frq", header = TRUE)
df.data1 <- data.frame(data1)
df.data1$CHR[df.data1$CHR == 7] <- "chr7"
head(df.data1, 10)
data2 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr7_geno_recodeA.raw", header = TRUE)
df.data2 <-data.frame(data2[7:ncol(data2)])
df.data2.transpose <- t(df.data2)
head(df.data2.transpose)
data3 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr7_geno.bim", header = FALSE)
df.data3 <- data.frame(data3[,4])
colnames(df.data3) <- "bp"
head(df.data3, 10)
data_all <- cbind(df.data1, df.data2.transpose, df.data3)
head(data_all)
data_all_1 <- subset(data_all, select = c(CHR, SNP, bp, A2, A1, MAF))
#head(data_all_select, 10)
data_all_2 <- data_all[8:ncol(data_all)-1]
head(data_all_2)
data_final <- cbind(data_all_1, data_all_2)
head(data_final)
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr7.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr7.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

# replace NA with 0 in data frame
data_final[is.na(data_final)] <- 0
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr7_NA.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr7_NA.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

#chr5
setwd("~/Desktop/PrediXcanExample")

#This is code for making PrediXcan input file for nonimputed file
data1 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr5_geno_freq.frq", header = TRUE)
df.data1 <- data.frame(data1)
df.data1$CHR[df.data1$CHR == 5] <- "chr5"
head(df.data1, 10)
data2 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr5_geno_recodeA.raw", header = TRUE)
df.data2 <-data.frame(data2[7:ncol(data2)])
df.data2.transpose <- t(df.data2)
head(df.data2.transpose)
data3 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr5_geno.bim", header = FALSE)
df.data3 <- data.frame(data3[,4])
colnames(df.data3) <- "bp"
head(df.data3, 10)
data_all <- cbind(df.data1, df.data2.transpose, df.data3)
head(data_all)
data_all_1 <- subset(data_all, select = c(CHR, SNP, bp, A2, A1, MAF))
#head(data_all_select, 10)
data_all_2 <- data_all[8:ncol(data_all)-1]
head(data_all_2)
data_final <- cbind(data_all_1, data_all_2)
head(data_final)
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr5.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr5.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

# replace NA with 0 in data frame
data_final[is.na(data_final)] <- 0
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr5_NA.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr5_NA.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

#chr4
setwd("~/Desktop/PrediXcanExample")

#This is code for making PrediXcan input file for nonimputed file
data1 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr4_geno_freq.frq", header = TRUE)
df.data1 <- data.frame(data1)
df.data1$CHR[df.data1$CHR == 4] <- "chr4"
head(df.data1, 10)
data2 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr4_geno_recodeA.raw", header = TRUE)
df.data2 <-data.frame(data2[7:ncol(data2)])
df.data2.transpose <- t(df.data2)
head(df.data2.transpose)
data3 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr4_geno.bim", header = FALSE)
df.data3 <- data.frame(data3[,4])
colnames(df.data3) <- "bp"
head(df.data3, 10)
data_all <- cbind(df.data1, df.data2.transpose, df.data3)
head(data_all)
data_all_1 <- subset(data_all, select = c(CHR, SNP, bp, A2, A1, MAF))
#head(data_all_select, 10)
data_all_2 <- data_all[8:ncol(data_all)-1]
head(data_all_2)
data_final <- cbind(data_all_1, data_all_2)
head(data_final)
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr4.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr4.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

# replace NA with 0 in data frame
data_final[is.na(data_final)] <- 0
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr4_NA.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr4_NA.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

#chr3
setwd("~/Desktop/PrediXcanExample")

#This is code for making PrediXcan input file for nonimputed file
data1 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr3_geno_freq.frq", header = TRUE)
df.data1 <- data.frame(data1)
df.data1$CHR[df.data1$CHR == 3] <- "chr3"
head(df.data1, 10)
data2 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr3_geno_recodeA.raw", header = TRUE)
df.data2 <-data.frame(data2[7:ncol(data2)])
df.data2.transpose <- t(df.data2)
head(df.data2.transpose)
data3 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr3_geno.bim", header = FALSE)
df.data3 <- data.frame(data3[,4])
colnames(df.data3) <- "bp"
head(df.data3, 10)
data_all <- cbind(df.data1, df.data2.transpose, df.data3)
head(data_all)
data_all_1 <- subset(data_all, select = c(CHR, SNP, bp, A2, A1, MAF))
#head(data_all_select, 10)
data_all_2 <- data_all[8:ncol(data_all)-1]
head(data_all_2)
data_final <- cbind(data_all_1, data_all_2)
head(data_final)
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr3.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr3.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

# replace NA with 0 in data frame
data_final[is.na(data_final)] <- 0
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr3_NA.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr3_NA.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

#chr2
setwd("~/Desktop/PrediXcanExample")

#This is code for making PrediXcan input file for nonimputed file
data1 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr2_geno_freq.frq", header = TRUE)
df.data1 <- data.frame(data1)
df.data1$CHR[df.data1$CHR == 2] <- "chr2"
head(df.data1, 10)
data2 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr2_geno_recodeA.raw", header = TRUE)
df.data2 <-data.frame(data2[7:ncol(data2)])
df.data2.transpose <- t(df.data2)
head(df.data2.transpose)
data3 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr2_geno.bim", header = FALSE)
df.data3 <- data.frame(data3[,4])
colnames(df.data3) <- "bp"
head(df.data3, 10)
data_all <- cbind(df.data1, df.data2.transpose, df.data3)
head(data_all)
data_all_1 <- subset(data_all, select = c(CHR, SNP, bp, A2, A1, MAF))
#head(data_all_select, 10)
data_all_2 <- data_all[8:ncol(data_all)-1]
head(data_all_2)
data_final <- cbind(data_all_1, data_all_2)
head(data_final)
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr2.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr2.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

# replace NA with 0 in data frame
data_final[is.na(data_final)] <- 0
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr2_NA.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr2_NA.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)


#chr1
setwd("~/Desktop/PrediXcanExample")

#This is code for making PrediXcan input file for nonimputed file
data1 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr1_geno_freq.frq", header = TRUE)
df.data1 <- data.frame(data1)
df.data1$CHR[df.data1$CHR == 1] <- "chr1"
head(df.data1, 10)
data2 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr1_geno_recodeA.raw", header = TRUE)
df.data2 <-data.frame(data2[7:ncol(data2)])
df.data2.transpose <- t(df.data2)
head(df.data2.transpose)
data3 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr1_geno.bim", header = FALSE)
df.data3 <- data.frame(data3[,4])
colnames(df.data3) <- "bp"
head(df.data3, 10)
data_all <- cbind(df.data1, df.data2.transpose, df.data3)
head(data_all)
data_all_1 <- subset(data_all, select = c(CHR, SNP, bp, A2, A1, MAF))
#head(data_all_select, 10)
data_all_2 <- data_all[8:ncol(data_all)-1]
head(data_all_2)
data_final <- cbind(data_all_1, data_all_2)
head(data_final)
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr1.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr1.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

# replace NA with 0 in data frame
data_final[is.na(data_final)] <- 0
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr1_NA.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr1_NA.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

#chr8
setwd("~/Desktop/PrediXcanExample")

#This is code for making PrediXcan input file for nonimputed file
data1 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr8_geno_freq.frq", header = TRUE)
df.data1 <- data.frame(data1)
df.data1$CHR[df.data1$CHR == 8] <- "chr8"
head(df.data1, 10)
data2 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr8_geno_recodeA.raw", header = TRUE)
df.data2 <-data.frame(data2[7:ncol(data2)])
df.data2.transpose <- t(df.data2)
head(df.data2.transpose)
data3 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr8_geno.bim", header = FALSE)
df.data3 <- data.frame(data3[,4])
colnames(df.data3) <- "bp"
head(df.data3, 10)
data_all <- cbind(df.data1, df.data2.transpose, df.data3)
head(data_all)
data_all_1 <- subset(data_all, select = c(CHR, SNP, bp, A2, A1, MAF))
#head(data_all_select, 10)
data_all_2 <- data_all[8:ncol(data_all)-1]
head(data_all_2)
data_final <- cbind(data_all_1, data_all_2)
head(data_final)
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr8.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr8.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

# replace NA with 0 in data frame
data_final[is.na(data_final)] <- 0
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr8_NA.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr8_NA.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

#chr11
setwd("~/Desktop/PrediXcanExample")

#This is code for making PrediXcan input file for nonimputed file
data1 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr11_geno_freq.frq", header = TRUE)
df.data1 <- data.frame(data1)
df.data1$CHR[df.data1$CHR == 11] <- "chr11"
head(df.data1, 10)
data2 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr11_geno_recodeA.raw", header = TRUE)
df.data2 <-data.frame(data2[7:ncol(data2)])
df.data2.transpose <- t(df.data2)
head(df.data2.transpose)
data3 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr11_geno.bim", header = FALSE)
df.data3 <- data.frame(data3[,4])
colnames(df.data3) <- "bp"
head(df.data3, 10)
data_all <- cbind(df.data1, df.data2.transpose, df.data3)
head(data_all)
data_all_1 <- subset(data_all, select = c(CHR, SNP, bp, A2, A1, MAF))
#head(data_all_select, 10)
data_all_2 <- data_all[8:ncol(data_all)-1]
head(data_all_2)
data_final <- cbind(data_all_1, data_all_2)
head(data_final)
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr11.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr11.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

# replace NA with 0 in data frame
data_final[is.na(data_final)] <- 0
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr11_NA.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr11_NA.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

#chr6
setwd("~/Desktop/PrediXcanExample")

#This is code for making PrediXcan input file for nonimputed file
data1 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr6_geno_freq.frq", header = TRUE)
df.data1 <- data.frame(data1)
df.data1$CHR[df.data1$CHR == 6] <- "chr6"
head(df.data1, 10)
data2 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr6_geno_recodeA.raw", header = TRUE)
df.data2 <-data.frame(data2[7:ncol(data2)])
df.data2.transpose <- t(df.data2)
head(df.data2.transpose)
data3 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr6_geno.bim", header = FALSE)
df.data3 <- data.frame(data3[,4])
colnames(df.data3) <- "bp"
head(df.data3, 10)
data_all <- cbind(df.data1, df.data2.transpose, df.data3)
head(data_all)
data_all_1 <- subset(data_all, select = c(CHR, SNP, bp, A2, A1, MAF))
#head(data_all_select, 10)
data_all_2 <- data_all[8:ncol(data_all)-1]
head(data_all_2)
data_final <- cbind(data_all_1, data_all_2)
head(data_final)
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr6.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr6.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

# replace NA with 0 in data frame
data_final[is.na(data_final)] <- 0
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr6_NA.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr6_NA.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

#chr9
setwd("~/Desktop/PrediXcanExample")

#This is code for making PrediXcan input file for nonimputed file
data1 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr9_geno_freq.frq", header = TRUE)
df.data1 <- data.frame(data1)
df.data1$CHR[df.data1$CHR == 9] <- "chr9"
head(df.data1, 10)
data2 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr9_geno_recodeA.raw", header = TRUE)
df.data2 <-data.frame(data2[7:ncol(data2)])
df.data2.transpose <- t(df.data2)
head(df.data2.transpose)
data3 <- read.table("~/Desktop/SHAPEIT/Meltzer/Meltzer_050712_alleledecode_TR_IBScluster_SCZ_chr9_geno.bim", header = FALSE)
df.data3 <- data.frame(data3[,4])
colnames(df.data3) <- "bp"
head(df.data3, 10)
data_all <- cbind(df.data1, df.data2.transpose, df.data3)
head(data_all)
data_all_1 <- subset(data_all, select = c(CHR, SNP, bp, A2, A1, MAF))
#head(data_all_select, 10)
data_all_2 <- data_all[8:ncol(data_all)-1]
head(data_all_2)
data_final <- cbind(data_all_1, data_all_2)
head(data_final)
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr9.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr9.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)

# replace NA with 0 in data frame
data_final[is.na(data_final)] <- 0
write.table(data_final, "~/Desktop/PrediXcanExample/genotype_file_chr9_NA.txt", quote=FALSE, row.names= FALSE, col.names=FALSE)
gz1 <- gzfile("~/Desktop/PrediXcanExample/genotype_file_chr9_NA.gz")
write.table(data_final, gz1, quote=FALSE, row.names= FALSE, col.names=FALSE)
close(gz1)
