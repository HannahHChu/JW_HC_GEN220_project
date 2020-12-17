#install.packages('dplyr')
#install.packages('ggplot2')
#install.packages('tidyverse')
#install.packages('phylogram')
install.packages('phytools')

library(ape)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(phylogram)
library(phytools)

#Read in data
final_dat <- read.csv("https://raw.githubusercontent.com/HannahHChu/JW_HC_GEN220_project/main/final_table.csv")

#Sort by Order
sorted_dat <- final_dat[order(final_dat$Order), ]

#Analyze Genome Size
ggplot(sorted_dat, aes(x=Species, y=Genome.Size, fill=Order)) + geom_bar(stat="identity")+theme(axis.text.x = element_text(angle = 90))

#Plotting Genome Size vs CDS length
#qplot(x=Genome.Size, y=CDS.Length, data=sorted_dat, geom = "point")
ggplot(sorted_dat, aes(Genome.Size, CDS.Length, colour = Order))+
          geom_point()


CDS_per <- c((sorted_dat$CDS.Length/sorted_dat$Genome.Size)*100)
sorted_dat['CDS.Percentage'] <- CDS_per

# Create Phylogenetic Tree
text.string<-"(Crustaceans,(Archaeognatha,(Zygentoma,((Odonata,Ephemeroptera),(((Zoraptera,Dermaptera),(Plecoptera,(Orthoptera,(Mantodea,Blattodea),(Notoptera,(Embioptera,Phasmotodea))))),((Thysanoptera,Hemiptera),(Psocodea,(Hymenoptera,(((Megaloptera,Neuroptera),Raphidioptera),((Strepsiptera,Coleoptera),((Trichoptera,Lepidoptera),((Siphonaptera,Mecoptera),Diptera))))))))))));)"
vert.tree<-read.tree(text=text.string)
plot(vert.tree,no.margin=TRUE,edge.width=2)


#Stacked barplot analyzing CDS percentage

ggplot(data = sorted_dat, aes(x = Order, y = Genome.Size, fill = CDS.Length)) + 
  geom_bar(stat = "identity") 
