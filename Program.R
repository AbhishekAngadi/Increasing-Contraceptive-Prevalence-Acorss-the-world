
#GLOBAL CONTRACEPTIVE PREVALENCE 

#Libraries and working dictionary -------------------------------------------------------------------------------------

setwd("C:/Users/abhis/OneDrive - Duke University/IDS 702 Modeling and Representation of Data/Final Project")
datasets_location<-"C:/Users/abhis/OneDrive - Duke University/IDS 702 Modeling and Representation of Data/Final Project/Topics/UN Data - Demographics and Fertility/Impotable data sets"

library("readxl")
library("xlsx")
library(qdap)


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------


#Importing data
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#y variable
contraceptive_prev<-read_excel(paste0(datasets_location,"/Contraceptive prevalence.xlsx"),sheet = "DATA")
contraceptive_prev<-as.data.frame(contraceptive_prev)
#contraceptive_prev<-read.xlsx(paste0(datasets_location,"/Contraceptive prevalence.xlsx"),sheetName = "DATA")

#GDP
gdp<-read_excel(paste0(datasets_location,"/gdp.xlsx"))
colnames(gdp)<-gsub(pattern = " ","_",colnames(gdp))
gdp<-as.data.frame(gdp)

#gdp2
gdp2<-read_excel(paste0(datasets_location,"/gdp2.xls"),skip = 3)
colnames(gdp2)<-gsub(pattern = " ","_",colnames(gdp2))
gdp2<-as.data.frame(gdp2)

#gdp3
gdp3<-read_excel(paste0(datasets_location,"/gdp3.xls"),skip = 3)
colnames(gdp3)<-gsub(pattern = " ","_",colnames(gdp3))
gdp3<-as.data.frame(gdp3)

#sex ratio
sex_ratio<-read_excel(paste0(datasets_location,"/SEX_RATIO_OF_TOTAL_POPULATION.xlsx"),skip = 15)
colnames(sex_ratio)<-gsub(pattern = " ","_",colnames(sex_ratio))
sex_ratio<-as.data.frame(sex_ratio)

#pop_density
pop_density<-read_excel(paste0(datasets_location,"/POPULATION_DENSITY.xlsx"),skip = 16)
colnames(pop_density)<-gsub(pattern = " ","_",colnames(pop_density))
pop_density<-as.data.frame(pop_density)

#urbanization_Rate
urbanization_Rate<-read_excel(paste0(datasets_location,"/Urbanization_Rate.xls"),skip = 16)
colnames(urbanization_Rate)<-gsub(pattern = " ","_",colnames(urbanization_Rate))
urbanization_Rate<-as.data.frame(urbanization_Rate)

#Literacy_Rate
literacy_Rate<-read_excel(paste0(datasets_location,"/Literacy rate.xlsx"))
colnames(literacy_Rate)<-gsub(pattern = " ","_",colnames(literacy_Rate))
literacy_Rate<-as.data.frame(literacy_Rate)

#Literacy_Rate 2
literacy_Rate2<-read_excel(paste0(datasets_location,"/Literacy rates above 15.xlsx"))
colnames(literacy_Rate2)<-gsub(pattern = " ","_",colnames(literacy_Rate2))
literacy_Rate2<-as.data.frame(literacy_Rate2)

#Policies
policies<-read_excel(paste0(datasets_location,"/Policies .xlsx"),skip=1)
colnames(policies)<-gsub(pattern = " ","_",colnames(policies))
policies<-as.data.frame(policies)

#Measures Fertility
measures_fertility<-read_excel(paste0(datasets_location,"/Measures Fertility.xlsx"),skip=1)
colnames(measures_fertility)<-gsub(pattern = " ","_",colnames(measures_fertility))
measures_fertility<-as.data.frame(measures_fertility)

#legal marriage age
legal_marriage_age<-read_excel(paste0(datasets_location,"/Legal Age for Marriage.xls"),skip = 4)
colnames(legal_marriage_age)<-gsub(pattern = " ","_",colnames(legal_marriage_age))
legal_marriage_age<-as.data.frame(legal_marriage_age)

#marital status
marital_status<-read_excel(paste0(datasets_location,"/MARITAL_STATUS.xlsx"),skip = 2,sheet="MARITAL_STATUS_BY_AGE")
colnames(marital_status)<-gsub(pattern = " ","_",colnames(marital_status))
marital_status<-as.data.frame(marital_status)

#Gender Inequality Index
gender_IE_Index<-read_excel(paste0(datasets_location,"/Gender Inequality Index.xls"),skip = 5)
colnames(gender_IE_Index)<-gsub(pattern = " ","_",colnames(gender_IE_Index))
gender_IE_Index<-as.data.frame(gender_IE_Index)

#tourism
tourism<-read_excel(paste0(datasets_location,"/tourism2.xls"))
colnames(tourism)<-gsub(pattern = " ","_",colnames(tourism))
tourism<-as.data.frame(tourism)

#tourism 2
tourism2<-read_excel(paste0(datasets_location,"/International tourism number of arrivals.xlsx"))
colnames(tourism2)<-gsub(pattern = " ","_",colnames(tourism2))
tourism2<-as.data.frame(tourism2)

#total Population
total_pop<-read_excel(paste0(datasets_location,"/TOTAL_POPULATION_BOTH_SEXES.xlsx"),skip=16)
colnames(total_pop)<-gsub(pattern = " ","_",colnames(total_pop))
total_pop<-as.data.frame(total_pop)

#GNI_PP
gni_pp<-read_excel(paste0(datasets_location,"/GNI PPP.xls"),skip = 3)
colnames(gni_pp)<-gsub(pattern = " ","_",colnames(gni_pp))
gni_pp<-as.data.frame(gni_pp)

#GNI_atlas
gni_atlas<-read_excel(paste0(datasets_location,"/GNI atlas.xls"),skip = 3)
colnames(gni_atlas)<-gsub(pattern = " ","_",colnames(gni_atlas))
gni_atlas<-as.data.frame(gni_atlas)

#hdi
hdi<-read_excel(paste0(datasets_location,"/hdi.xlsX"),skip = 2)
colnames(hdi)<-gsub(pattern = " ","_",colnames(hdi))
hdi<-as.data.frame(hdi)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------


#Collating and finilizing dataset
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#standarizing names to map better
#country_name_container<-c("Hong","Korea","Bahamas","United(.*)State","America","(.*)Ivoire","Czech","Gambia","Gaum","Lao","Kyrg","Moldova","Russia","kitt","Lucia","Vincent","Principe","Slovakia","Macedonia","Tanzania","Viet","Dem(.*)Congo","[^dem](.*)congo","[^south](.*)sudan")
#country_name_standards<-c("Hong Kong","Korea","Bahamas","USA","USA","Ivoire","Czech","Gambia","Gaum","Lao","Kyrgy","Moldova","Russia","Kitts","Lucia","Vincent","Principe","Slovakia","Macedonia","Tanzania","Vietnam","Democratic Republic of the Congo","Congo","sudan")

country_name_container<-c("Hong","Korea","Bahamas","United(.*)State","America","(.*)Ivoire","Czech","Gambia","Gaum","Lao","Kyrg","Moldova","Russia","kitt","Lucia","Vincent","Principe","Slovakia","Macedonia","Tanzania","Viet","congo","Britain")
country_name_standards<-c("Hong Kong","Korea","Bahamas","USA","USA","Ivoire","Czech","Gambia","Gaum","Lao","Kyrgy","Moldova","Russia","Kitts","Lucia","Vincent","Principe","Slovakia","Macedonia","Tanzania","Vietnam","Congo","United Kingdom")

remove_country_list<-c("America(.*)Samoa","Dem(.*)Congo","Congo(.*)dem","Sudan","North(.*)Korea","dem(.*)Korea","Korea(.*)DEM","Virgin","Anguilla")
remove_country_list<-c(remove_country_list,"north(.*)america","south(.*)america","central(.*)america","latin(.*)america")
remove_country_list<-c(remove_country_list,"©union")

standardize <- function(temp) {
  
  #cleaning country names
  temp[1] <-  genX(temp[,1], " (", ")")
  temp<-temp[is.na(temp[,1])=="FALSE",]
  
  #removing few countries
  for (j in 1:length(remove_country_list)){
    temp<-temp[grepl(remove_country_list[j],x = temp[,1],temp,ignore.case = TRUE)==FALSE,]
  }
  
  #standerizing names
  for (i in 1:nrow(temp)){
    for (j in 1:length(country_name_container)){
      if(grepl(country_name_container[j],x = temp[i,1],temp,ignore.case = TRUE)==TRUE){temp[i,1]<-country_name_standards[j]}
    }
    
  }
  
  #creating ID
  temp$ID <- seq.int(nrow(temp))
  
  return(temp)
}





#temp[grepl("USA",x = temp$Country_or_area,temp,ignore.case = TRUE),1:4]


#main dataset
summary(main_data)

#Contraceptive prevalence
#considering recent values
contraceptive_prev<-contraceptive_prev[order(contraceptive_prev[1],-contraceptive_prev[3]),]
temp <- contraceptive_prev[!duplicated(contraceptive_prev[1]),]
#creating temp table to pick desired columns 
temp2<-temp[,c(1,7,8,9,10,14)]
temp2<-temp2[is.na(temp2[,1])=="FALSE",]
#standarizing
temp2<-standardize(temp2)
#transforming to desired format
temp2[,2]<-as.numeric(as.character(temp2[,2]))
temp2[,3]<-as.numeric(temp2[,3])
temp2[,4]<-as.numeric(temp2[,4])
temp2[,5]<-as.numeric(temp2[,5])
temp2[,6]<-as.numeric(temp2[,6])
temp2[,7]<-as.numeric(temp2[,7])

summary(temp2)
#merging to the main data set
main_data <- temp2



#GDP
temp<-gdp
#creating temp table to pick desired columns 
temp2<-temp[,c(1,3)]
colnames(temp2)<-c("Country_or_area","GDP")
#standarizing
temp2<-standardize(temp2)
blah<-temp2
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)


#sex ratio
temp<-sex_ratio
#creating temp table to pick desired columns 
temp2<-temp[15:nrow(temp),c(3,19)]
colnames(temp2)<-c("Country_or_area","sex_ratio_2015")
#standarizing
temp2<-standardize(temp2)
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)

#pop_density
temp<-pop_density
#creating temp table to pick desired columns 
temp2<-temp[15:nrow(temp),c(3,71)]
colnames(temp2)<-c("Country_or_area","pop_density_2015")
#standarizing
temp2<-standardize(temp2)
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)


#urbanization_Rate
temp<-urbanization_Rate
#creating temp table to pick desired columns 
temp2<-temp[15:nrow(temp),c(2,18)]
colnames(temp2)<-c("Country_or_area","UR_2015_2018")
#standarizing
temp2<-standardize(temp2)
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)


#Literacy_Rate
temp<-literacy_Rate
#creating temp table to pick desired columns 
temp2<-temp[,c(1,6)]
colnames(temp2)<-c("Country_or_area","Literacy_Rate")
#standarizing
temp2<-standardize(temp2)
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)


#policies
temp<-policies
#creating temp table to pick desired columns 
temp2<-temp[1:197,c(1,12)]
colnames(temp2)<-c("Country_or_area",colnames(temp2)[-1])
#standarizing
temp2<-standardize(temp2)
temp2[,2]<-as.factor(temp2[,2])
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)


#Measures Fertility - used for region development measure and region :P
temp<-measures_fertility
#creating temp table to pick desired columns 
temp2<-temp[1:197,c(1,3,4)]
colnames(temp2)<-c("Country_or_area",colnames(temp2)[-1])
#standarizing
temp2<-standardize(temp2)
temp2[,2]<-as.factor(temp2[,2])
temp2[,3]<-as.factor(temp2[,3])
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)


#Legal Age
temp<-legal_marriage_age
#creating temp table to pick desired columns 
temp2<-temp[,c(1,4,9)]
colnames(temp2)<-c("Country_or_area","men_legal_marriage_age","legal age men 2")
#standarizing
#temp2<-temp2[temp2[2]!="…",]
temp2$Country_or_area<-gsub("[0-9]","",temp2$Country_or_area)
temp2$Country_or_area<-gsub(',',"",temp2$Country_or_area)
temp2<-standardize(temp2)
temp2[,2]<-as.numeric(temp2[,2])
for (i in 1:nrow(temp2)){
  if (is.na(temp2[i,2])==TRUE){temp2[i,2]<-as.numeric(temp2[i,3])}
}
temp2<-temp2[,-3]
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)
#blah<-main_data[is.na(main_data$men_legal_marriage_age)==TRUE,c(1,9)]


#gender_IE_index
temp<-gender_IE_Index
temp<-temp[-180,]
#creating temp table to pick desired columns 
temp2<-temp[,c(2,3)]
colnames(temp2)<-c("Country_or_area",colnames(temp2)[-1])
#standarizing
temp2<-temp2[temp2[2]!="..",]
temp2<-standardize(temp2)
temp2[,2]<-as.numeric(temp2[,2])
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)
#blah<-main_data[is.na(main_data$Gender_Inequality_Index_2014)==TRUE,c(1,10)]


#total Population
temp<-total_pop
#creating temp table to pick desired columns 
temp2<-temp[15:nrow(temp),c(3,71)]
colnames(temp2)<-c("Country_or_area","total_pop_2015")
#standarizing
temp2<-standardize(temp2)
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)

main_data2<-main_data[is.na(main_data$GDP)==FALSE,]
blah<-main_data2[is.na(main_data2$Literacy_Rate)==TRUE,]

blah2<-main_data[is.na(main_data$GDP)==TRUE,]


#hdi
temp<-hdi
temp<-temp[-182,]
#creating temp table to pick desired columns 
temp2<-temp[4:195,c(2,3,15)]
colnames(temp2)<-c("Country_or_area","HDI",colnames(temp2)[c(-1,-2)])
#standarizing
temp2<-standardize(temp2)
temp2[,2]<-as.numeric(temp2[,2])
temp2[,3]<-as.numeric(temp2[,3])
#main_data<-main_data[,-18]
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)
blah<-main_data[is.na(main_data$`Human_Development_Index_(HDI)`)==TRUE,c(1,10)]



#-------------------------------
#looking at few datasets again

#Toursim - 2
temp<-tourism2[,c(-2,-3,-4)]
temp$all_values<-""
for (i in 1:nrow(temp)){
  for (j in (ncol(temp)-1):2){
    if (is.na(temp[i,j])==FALSE){
      temp$all_values[i]<-paste(temp$all_values[i],as.character(temp[i,j]),",")
    }
  }
}
for (i in 1:nrow(temp)){
  temp$number_of_arrivals[i]<-as.numeric((strsplit(temp$all_values[i],split = ",")[[1]])[1])
}

#creating temp table to pick desired columns 
temp2<-temp[,c(1,61)]
colnames(temp2)<-c("Country_or_area",colnames(temp2)[-1])
#standarizing
temp2<-standardize(temp2)
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)

#blah2<-main_data[is.na(main_data$number_of_arrivals)==TRUE,]

######

#GNI PP
temp<-gni_pp[,c(-2,-3,-4)]
temp$all_values<-""
for (i in 1:nrow(temp)){
  for (j in (ncol(temp)-1):2){
    if (is.na(temp[i,j])==FALSE){
      temp$all_values[i]<-paste(temp$all_values[i],as.character(temp[i,j]),",")
    }
  }
}
for (i in 1:nrow(temp)){
  temp$gni_pp_latest[i]<-as.numeric((strsplit(temp$all_values[i],split = ",")[[1]])[1])
}

#creating temp table to pick desired columns 
temp2<-temp[,c(1,61)]
colnames(temp2)<-c("Country_or_area",colnames(temp2)[-1])
#standarizing
temp2<-standardize(temp2)
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)

#blah2<-main_data[is.na(main_data$number_of_arrivals)==TRUE,]

#####
######

#GNI atlas
temp<-gni_atlas[,c(-2,-3,-4)]
temp$all_values<-""
for (i in 1:nrow(temp)){
  for (j in (ncol(temp)-1):2){
    if (is.na(temp[i,j])==FALSE){
      temp$all_values[i]<-paste(temp$all_values[i],as.character(temp[i,j]),",")
    }
  }
}
for (i in 1:nrow(temp)){
  temp$gni_atlas_latest[i]<-as.numeric((strsplit(temp$all_values[i],split = ",")[[1]])[1])
}

#creating temp table to pick desired columns 
temp2<-temp[,c(1,61)]
colnames(temp2)<-c("Country_or_area",colnames(temp2)[-1])
#standarizing
temp2<-standardize(temp2)
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)

#blah2<-main_data[is.na(main_data$number_of_arrivals)==TRUE,]


#####
######

#GDP per capita
temp<-gdp2[,c(-2,-3,-4)]
temp$all_values<-""
for (i in 1:nrow(temp)){
  for (j in (ncol(temp)-1):2){
    if (is.na(temp[i,j])==FALSE){
      temp$all_values[i]<-paste(temp$all_values[i],as.character(temp[i,j]),",")
    }
  }
}
for (i in 1:nrow(temp)){
  temp$gdp_per_capita[i]<-as.numeric((strsplit(temp$all_values[i],split = ",")[[1]])[1])
}

#creating temp table to pick desired columns 
temp2<-temp[,c(1,61)]
colnames(temp2)<-c("Country_or_area",colnames(temp2)[-1])
#standarizing
temp2<-standardize(temp2)
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)

#blah2<-main_data[is.na(main_data$number_of_arrivals)==TRUE,]

#######
#######

#GDP growth per capita
temp<-gdp3[,c(-2,-3,-4)]
temp$all_values<-""
for (i in 1:nrow(temp)){
  for (j in (ncol(temp)-1):2){
    if (is.na(temp[i,j])==FALSE){
      temp$all_values[i]<-paste(temp$all_values[i],as.character(temp[i,j]),",")
    }
  }
}
for (i in 1:nrow(temp)){
  temp$gdp_growth_per_capita[i]<-as.numeric((strsplit(temp$all_values[i],split = ",")[[1]])[1])
}

#creating temp table to pick desired columns 
temp2<-temp[,c(1,61)]
colnames(temp2)<-c("Country_or_area",colnames(temp2)[-1])
#standarizing
temp2<-standardize(temp2)
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)

blah2<-main_data[is.na(main_data$gdp_growth_per_capita)==TRUE,]
































#Literacy_Rate - 2
temp<-literacy_Rate2[,c(-2,-3,-4)]
temp$all_values<-""
for (i in 1:nrow(temp)){
  for (j in (ncol(temp)-1):2){
    if (is.na(temp[i,j])==FALSE){
      temp$all_values[i]<-paste(temp$all_values[i],as.character(temp[i,j]),",")
    }
  }
}
for (i in 1:nrow(temp)){
  temp$literacy_Rate_latest[i]<-as.numeric((strsplit(temp$all_values[i],split = ",")[[1]])[1])
}

#creating temp table to pick desired columns 
temp2<-temp[,c(1,61)]
blah2<-temp2[is.na(temp2$literacy_Rate_latest)==TRUE,]


#Literacy_Rate
temp<-literacy_Rate
#creating temp table to pick desired columns 
temp2<-temp[,c(1,6)]
colnames(temp2)<-c("Country_or_area","Literacy_Rate")
#standarizing
temp2<-standardize(temp2)
#merging to the main data set
main_data <- merge(main_data,temp2[,-ncol(temp2)],by = "Country_or_area",all.x=TRUE)


write.csv(main_data, file = "main_data.csv")
