# plotly 패키지 설치
install.packages("plotly")
library(plotly)

# ggplot2로 그래프를 만들고 ggplotly()에 적용하기
library(ggplot2)
p <- ggplot(data=mpg, aes(x=displ, y=hwy, col=drv)) + geom_point()
ggplotly(p)

# 인터랙티브 막대 그래프 그리기
p <- ggplot(data=diamonds, aes(x=cut, fill=clarity)) +
  geom_bar(position = "dodge")
ggplotly(p)

# 인터랙티브 시계열 그래프 그리기

# dygraphs 패키지 설치
install.packages("dygraphs")
library(dygraphs)

# econimics 데이터 불러오기
economics <- ggplot2::economics
head(economics)

# xts()로 unemploy를 xts 타입으로 변경하기(시계열 데이터 쉽게 다루기 위한 형식)
library(xts)
eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)
dygraph(eco)

# 날짜 범위 선택 기능 추가하기
dygraph(eco) %>% dyRangeSelector()

# 여러 값 동시에 표현하기

# 저축률
eco_a <- xts(economics$psavert, order.by=economics$date)

# 실업자 수
eco_b <- xts(economics$unemploy/1000, order.by = economics$date)

# 두 데이터 cbind()로 결합하기
eco2 <- cbind(eco_a, eco_b)
colnames(eco2) <- c("psavert", "unemploy") # xts이므로 rename() 사용 불가
head(eco2)

# 그래프로 표현하기
dygraph(eco2) %>% dyRangeSelector()



