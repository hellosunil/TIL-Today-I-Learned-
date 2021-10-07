install.packages("mapproj")
install.packages("ggiraphExtra")
library(ggiraphExtra)

# 미국 주별 범죄 데이터(R에 내장된 USArrests 데이터)
str(USArrests)
head(USArrests)
###Murder Assault UrbanPop Rape
###Alabama      13.2     236       58 21.2
###Alaska       10.0     263       48 44.5
###Arizona       8.1     294       80 31.0
###Arkansas      8.8     190       50 19.5
###California    9.0     276       91 40.6
###Colorado      7.9     204       78 38.7
### ==> 행 이름이 지역명으로 되어 있음

# 행이름을 state 변수로 바꾸기

library(tibble)
crime <- rownames_to_column(USArrests, var = "state")
crime$state <- tolower(crime$state) # 소문자로 수정
str(crime)

# 미국 주 지도 데이터 준비하기
install.packages("maps")
library("ggplot2")
states_map <- map_data("state")
str(states_map)

# 단계 구분도 만들기
ggChoropleth(data=crime,
             aes(fill=Murder,
                 map_id=state),
             map=states_map)

# 인터랙티브 단계 구분도 만들기
ggChoropleth(data=crime,
             aes(fill=Murder,
                 map_id=state),
             map=states_map,
             interactive =T) # 마우스 올리면 반응 # save as web page


# 대한민국 시도별 인구, 결핵 환자 수 단계 구분도 만들기

# 대한민국 지도 사용하기
install.packages("stringi")
install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")
library(kormaps2014)

# 대한민국 시도별 인구 데이터 준비하기, 한글 데이터 보기위해 changeCode 이용
str(changeCode(korpop1))

# 변수명 한글로 변경 후, cp949로 인코딩
library(dplyr)
korpop1 <- rename(korpop1, pop = 총인구_명, name = 행정구역별_읍면동)
korpop1$name <- iconv(korpop1$name, "UTF-8", "CP949")

# 대한민국 시도 지도 데이터 준비하기
str(changeCode(kormap1))

# 단계 구분도 만들기
ggChoropleth(data = korpop1,
             aes(fill = pop,
                 map_id = code,
                 tooltip = name),
             map = kormap1,
             interactive = T)




# 결핵 환자 수 단계 구분도 만들기
str(changeCode(tbc))
tbc$name <- iconv(tbc$name, "UTF-8", "CP949")
ggChoropleth(data=tbc,
             aes(fill=NewPts,
                 map_id=code,
                 tooltip=name),
             map=kormap1,
             interactive = T)












