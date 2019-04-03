require(dplyr)

## GLM model
# vo.glmer <- glmer(veh ~ hhsize + wrkcount + lnhhfaminc + hh_race + 
#                     lnactden + jobpop+ transitden + intden + 
#                     pct4way + lnpopden_county + uber_year + taxi + 
#                     rideshare + gasprice + (1|ct_new) + (1|county_new), 
#                   data=data, family=poisson(),nAGQ=0, 
#                   control = glmerControl(optimizer = "nloptwrap", calc.derivs = FALSE))

dat = read.csv("Final_R.csv")
str(dat)
head(dat)

dat2 = dat[,-c(1,2,3,4,5,6,7,8,9)]
dat3 = dat %>% 
  select(veh, hhsize, wrkcount, lnhhfaminc, hh_race, lnactden,
         jobpop, transitden, intden, pct4way, lnpopden_county, uber_year,
         taxi, rideshare, gasprice, ct_new, county_new)

dat3 = dat3 %>% filter(taxi > -7)

dat3 = dat3[which(complete.cases(dat3)),]

names(dat3)

save(dat3, file="data.RData")

# dat3.s = scale(dat3)
# 
# save(dat3.s, file="data.s.RData")
