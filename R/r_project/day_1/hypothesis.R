# t 검정 - 두 집단 간 평균 비교

# compact 자동차와 suv 자동차의 도시 연비 t 검정
mpg <- as.data.frame(ggplot2::mpg)
library(dplyr)
mpg_diff <- mpg %>%
  select(class, cty) %>%
  filter(class %in% c("compact", "suv"))
head(mpg_diff)
table(mpg_diff$class)

# t 검정 실시하기
t.test(data=mpg_diff, cty ~ class, var.equal=T) # 분산이 같다고 가정
 # p-value < 0.05 통계적으로 유의함, suv연비가 compact보다 뛰어남

# 일반 휘발유와 고급 휘발유의 도시 연비 t검정
mpg_diff2 <- mpg %>%
  select(fl, cty) %>%
  filter(fl %in% c("r", "p"))

table(mpg_diff2$fl)
t.test(data=mpg_diff2, cty ~ fl, val.equal=T)
 # p-vlaue > 0.05, 통계적으로 유의미하지 않다.



# 상관분석
# 실업자 수와 개인 소비 지출의 상관관계 구하기

economics <- as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce)
 # p-value < 0.05, 통계적으로 유의하며 cor = 0.6145


# 상관행렬 히트맵 만들기
head(mtcars) # 내장 데이터
car_cor <- cor(mtcars)
round(car_cor, 2)

install.packages("corrplot")
library(corrplot)

corrplot(car_cor)

# 원대신 숫자로 표시하기
corrplot(car_cor, method="number")

# 색상표 만들어 활용하기
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))

corrplot(car_cor,
         method = "color", # 색으로 표현
         col = col(200), # 색상 200개 선정
         type = "lower", # 왼쪽 아래 행렬만 표시
         order = "hclust", # 유사한 상관계수끼리 군집화
         addCoef.col = "black", # 상관계수 색깔
         tl.col = 'black', # 변수명 색깔
         tl.srt = 45, # 변수명 45도 기울임
         diag=F) # 대각 행렬 제외
