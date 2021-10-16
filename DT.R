library(rgdal)
library(raster)
library(rpart)

#training data 
TD <- readOGR(dsn = '.', layer = 'traindelhi')
summary(TD)
unique(TD$Classname)
plot(TD)

#composite bands

delhi <- brick('clipped_delhi.tif')
plotRGB(delhi, r=4,g=3,b=2, stretch='lin')
plot(TD, add=TRUE)

x <- extract(delhi, TD, df=TRUE)
names(x)
dim(x)

x$lc <- as.factor(TD$Classvalue[x$ID])
x$desc <- as.factor(TD$Classname[x$ID])
names(x) <- c('ID','b1','b2','b3','b4','lc','desc')

#Decision Tree model

delhi_dt <- rpart(lc~b1+b2+b3+b4, data=x, method = 'class', minsplit=5)
text(delhi_dt,cex=0.8)
delhi_class <- delhi
names(delhi_class) <- c('b1','b2','b3','b4')
delhi_predict <- predict(delhi_class, delhi_dt,type= 'class', na.rm=TRUE)
plot(delhi_predict)

#export map
writeRaster(delhi_predict, 'delhi_decisiontree.tif', format='GTiff',datatype='INT1U',overwrite=TRUE)
