RawData <- read.csv("recs2015_public_v2.csv")
summary(RawData)


library(dplyr)
library(tidyr)

RawData %>%
  select(DOEID,
    REGIONC,
    TYPEHUQ,
    KOWNRENT,
    YEARMADERANGE,
    STUDIO,
    BEDROOMS,
    ADQINSUL,
    DRAFTY,
    AGERFRI1,
    AGEDW,
    ESCWASH,
    ESDISHW,
    ESDRYER,
    ESFREEZE,
    ESFRIG,
    ESLIGHT,
    ESWATER,
    ESWIN,
    ELPAY,
    NGPAY,
    ELWARM,
    ELCOOL,
    UGWARM,
    UGWATER) -> LimitedData

#summary(LimitedData)

# Model on how to recode.
# 
LimitedData$GasWaterTRUE <- ifelse(LimitedData$UGWATER==1, TRUE, FALSE)
#summary(LimitedData$GasWaterTRUE)


LimitedData$CensuRegion <- recode(LimitedData$REGIONC, `1` = "NorthEast", `2` = "Midwest", `3` = "South", `4` = "West")

