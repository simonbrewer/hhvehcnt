library(kohonen)
library(RColorBrewer)

load("data.RData")

gridX<-31
gridY<-30
grid.som <-somgrid(gridX, gridY, "hexagonal")

# dat.som <- som(as.matrix(dat3.s), grid = grid.som, rlen=1000)
plot(dat.som, type="changes")


plot(dat.som)

plot(dat.som, type="counts")

plot(dat.som, type="dist.neighbours")

myRCB = function(n, pal="YlGnBu") {
  brewer.pal(n, pal)
}

nnodes = gridX*gridY
nodeHVC = rep(NA, nnodes)
for (i in 1:nnodes) {
  nodeID = which(dat.som$unit.classif == i)
  if (length(nodeID) >0) {
    nodeHVC[i] = mean(dat$hhvehcnt[nodeID])
  }
}

plot(dat.som, type="property", property=nodeHVC, main="Mean HHVCount",
     palette.name=myRCB, ncolors=9)

## How do variables map to the SOM? 

myRCB = function(n, pal="Greens") {
  brewer.pal(n, pal)
}
varNames = names(dat3)
for (i in 1:length(varNames)) {
  plot(dat.som, type="property", property=dat.som$codes[[1]][,varNames[i]], main=varNames[i], 
       palette.name=myRCB, ncolors=9)
  # add.cluster.boundaries(dat.som, som.clus)
  # stop()
}

