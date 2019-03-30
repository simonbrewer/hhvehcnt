require(dplyr)

dat = read.csv("Final.csv")
str(dat)
head(dat)

dat2 = dat[,-c(1,2,3,4,5,6,7,8,9)]
dat3 = dat2 %>% 
  select(-tdaydate, -hhstate, -hh_cbsa, -scresp, -X_merge)

dat3 = dat3[which(complete.cases(dat3)),]
names(dat3)

dat3.s = scale(dat3)

save(dat3.s, file="data.RData")
