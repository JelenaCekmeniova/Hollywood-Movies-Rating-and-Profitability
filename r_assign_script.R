# Initial Exploratory Analysis

df<-read.csv("https://public.tableau.com/app/sample-data/HollywoodsMostProfitableStories.csv")

view(df)

install.packages("tidyverse")

view(df)

library(tidyverse)

str(df)


# Cleaning Data

colSums(is.na(df))

df1 <-df%>% drop_na()

colSums(is.na(df1))


# Exploratory Data Analysis

colSums(is.na(df1))

ggplot(df1, aes(x=Lead.Studio, y=Rotten.Tomatoes..)) + 
  geom_point()+ scale_y_continuous(labels = scales::comma)+coord_cartesian(ylim= c(0, 110)) +
  theme(axis.text.x= element_text(angle = 90))

ggplot(df1, aes(x=Year)) + geom_bar()


# Export Cleaned Data

write.csv(df1, "~/bootcamp IT tech/R_assignment/clean_df.csv")


#Additional practice

write.csv(df1, "~/bootcamp IT tech/R_assignment/clean_df2.csv")

df2 <- df1

summary(df2)
summary(df2$Profitability)
summary(df2$Worldwide.Gross)

mean(df2$Profitability)
median(df2$Profitability)
sd(df2$Profitability)
cov(df2$Profitability, df2$Worldwide.Gross)
cor(df2$Profitability, df2$Worldwide.Gross)

class(df2)
class(df2$Genre)
class(df2$Profitability)
class(df2$Audience..score..)

typeof(df2$Lead.Studio)
typeof(df2$Rotten.Tomatoes..)
typeof(df2$Worldwide.Gross)

table(df2$Film, df2$Genre)
df2[c("Film", "Genre")]

#group by

df3 <- df2 %>% group_by(Genre) %>%
  summarise(mean_profit=mean(Profitability),
            mean_gross=mean(Worldwide.Gross),
            .groups = 'drop') %>%
  as.data.frame()
df3

#if else

df4 <- df2
df4$Rating = ifelse(df4$Audience..score..<50, "Low Score",
             ifelse(df4$Audience..score..>=80, "High Score",
                    "Mid Score"))
df4





