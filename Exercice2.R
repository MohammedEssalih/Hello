

setwd("C:/analyse_microclimat")
setwd("C:/Users/karin.sahmer/Documents/Bouchra/Ray_tem_humAF_TA")
# data <- read.csv2(file.path("ray_glo_modif.csv")
# read.csv(file.choose(),header = TRUE, sep = ";", quote = "\"")
ray_glo <- read.csv("D:/dawnload/temp-hum_AF_TA_zone.csv",sep=";")

head(ray_glo)
ray_glo$Modalité
summary(ray_glo)
ray_glo$Modalite <- factor(ray_glo$Modalité)
ray_glo$Heure <- factor(ray_glo$Heure)
levels(ray_glo$Heure)
# [1] "00:00:00" "01:00:00" "02:00:00" "03:00:00" "04:00:00" "05:00:00" "06:00:00" "07:00:00"
# [9] "08:00:00" "09:00:00" "10:00:00" "11:00:00" "12:00:00" "13:00:00" "14:00:00" "15:00:00"
# [17] "16:00:00" "17:00:00" "18:00:00" "19:00:00" "20:00:00" "21:00:00" "22:00:00" "23:00:00"
ray_glo$Heure2 <- factor(ray_glo$Heure,levels=levels(ray_glo$Heure),
                         labels=c(rep("0-3",4),rep("4-7",4),rep("8-11",4),rep("12-16",4),rep("17-20",4),rep("21-24",4)))
with(ray_glo,table(Heure,Heure2,useNA="ifany"))
ray_glo$Zone1 <- factor(ray_glo$zone)
ray_glo$Mois <- factor(ray_glo$Mois)
summary(ray_glo)

library(ggplot2)
# data <-("ray_glo_modif.csv")
# donnee_subset <-data() [seq(0, 1 , by = 0.20),]
# ggplot(data=ray_glo , aes(x= Heure ,y= Rayonnement),fill=Zone) + geom_boxplot() + facet_wrap(~Zone)
ggplot(data=ray_glo , aes(x= Zone1 ,y= T.moyenne,fill=Zone1)) + geom_boxplot() + facet_grid(Mois ~ Heure2)


ggplot(data=ray_glo , aes(x= Heure ,Y= Rayonnement,Zone= cut())) + geom_boxplot()                                
# ggplot(data=donnee_subset , aes(x= heure ,Y= Rayonnement (KW/m?),zone= cut()) + geom_boxplot()+ facet_wrap(~cut)

