df_exam
rm(df_exam)
df_exam
# Error: object 'df_exam' not found
ls.rm()
df_exam <- read_excel("C:/r_project/data/excel_exam.xlsx")

# 데이터 파악하기
head(df_exam)
tail(df_exam)
View(df_exam)
dim(df_exam)
str(df_exam)
summary(df_exam)

df_exam1 <- read_excel("../data/excel_exam.xlsx")

# . -> 현재 디렉토리에서,    .. -> 상위폴더에서

# ggplot2의 mpg 데이터를 바로 데이터 프레임으로 생성
# mpg <- as.data.frame(패키지명::데이터이름)
mpg <- as.data.frame(ggplot2::mpg)
str(mpg)
?mpg
summary(mpg)

# 변수명 변경 시 : dplyr 패키지 필요

df_raw <- data.frame(var1 = c(1,1,2),
                     var2=c(2,3,2))

# 데이터 복사하기 rename(데이터프레임, 변경할변수 = 변경될변수)
df_new <- df_raw
df_new <- rename(df_new, v2 = var2)

# 데이터프레임의 변수 연산 결과를 추가할 경우

df <- data.frame(var1 = c(4, 3, 8), var2 = c(2, 6, 1) )

df$sum <- df$var1 + df$var2
df$mean <- (df$var1 + df$var2)/2
df
mpg
summary(mpg$total)

# 통합연비(cty/hwy) 변수 추가
mpg$total <- (mpg$cty + mpg$hwy)/2
mpg

# 통합연비에 대한 분포 시각화 작업 ㅣ hist()
hist(x=mpg$total)

# mpg$test <- ifelse(조건, 참일 경우, 거짓일 경우)
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
summary(mpg$test)

# mpg$test : 값 데이터에 대한 빈도수를 표 형태로 출력
table(mpg$test)

# mpg$total을 이용한 등급 부여(A:30, B:20, C:나머지)
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))
table(mpg$grade)
qplot(mpg$grade)






exam <- read_excel("C:/r_project/data/excel_exam.xlsx")

# filter() : 조건에 부합하는 값을 걸러내는 함수
# %>% : dplyr 패키지가 함수 나열하며 실행할 때 사용되는 표기법

exam %>% filter(class == 1)

a <- c(10, 15) %>% mean() %>% table()

# 여러 조건으로 비교하기

# AND
exam %>% filter(class != 1 & math >= 50)

# OR
exam %>% filter(class != 1 | math >= 50)

# 속해 있다
exam %>% filter(class %in% c(1,3,5))

# 필요한 변수에 해당하는 값들만 추출 : select()

exam %>% select(math, class)

# 불필요한 변수만 제외하고 추출

exam %>% select(-math)

# filter() 걸러내고 특정 필드만 선택 select()
r1 <- exam %>% filter(class==1)
r2 <- r1 %>% select(math)

result <- exam %>% filter(class==1) %>% select(math)
result <- exam %>% filter(class==1) %>% select(math) %>% head

# arrange() : 데이터 정렬
exam %>% arrange(math) # 오름차순 정렬
exam %>% arrange(desc(math)) # 내림차순

exam %>% arrange(math, class)

# 변수를 추가하는 함수 : mutate()

e <- exam %>% mutate(total = math + english + science,
                     mean = (math + english + science)/3)

e %>% mutate(test = ifelse(mean >= 70, "PASS", "FAIL")) %>% arrange(test)


# 그룹별로 요약 : summerize() / group_by()

exam %>% summarise(mean_math = mean(math))

exam %>% group_by(class) %>% summarise(mean_math = mean(math))

exam %>% group_by(class) %>% summarise(mean_math = mean(math),
                                       sum_math = sum(math),
                                       median_math = median(math),
                                       n = n())







# 중간/기말고사 데이터 생성
test1 <- data.frame(id = c(1,2,3,4,5), midterm=c(60,80,70,90,85))
test2 <- data.frame(id = c(1,2,3,4,5), midterm=c(70,83,65,95,80))

# 데이터 프레임 가로로 합치기
total <- left_join(test1, test2, by ='id')

# 학생 1-5 데이터 생성
group_a <- data.frame(id = c(1,2,3,4,5), test = c(60,80,70,90,85))

# 학생 1-5 데이터 생성
group_b <- data.frame(id = c(6,7,8,9,10), test = c(70,83,65,95,80))

# 데이터프레임 세로로 합치기
group_all <- bind_rows(group_a, group_b)



# 결측치 찾기

df <- data.frame(sex=c("M","F",NA,"M","F"), score=c(5,4,3,4,NA))
is.na(df)
table(is.na(df))
table(is.na(df$sex))
mean(df$score) # ==> NA를 반환

# 결측치 제거하기

# 결측치 행만 추출
df %>% filter(is.na(score))

# 결측치가 아닌 행만 추출
df %>% filter(!is.na(score))

# score의 결측치가 없는 df 만들기
df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)

# score, sex 모두 결측치 없애기
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))

# 결측치가 하나라도 있는 행 제거하기
df_nomiss2 <- na.omit(df)

# 결측치를 무시하고 계산하기 : na.rm ==> NA REMOVE

mean(df$score, na.rm = T)
sum(df$score, na.rm = T)

exam[c(3,8,15), "math"] <- NA # 3, 8, 15행의 math 변수에 NA 넣기

exam %>% summarise(mean_math = mean(math, na.rm=T),
                   sum_math = sum(math, na.rm=T),
                   median_math = median(math, na.rm=T))

# 결측값 대체하기

# 평균으로 대체하기
mean(exam$math, na.rm = T)
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))
exam




# 이상치 제거하기

# 남1, 여2 , score 1~5

outlier <- data.frame(sex=c(1,2,1,3,2,1),
                      score=c(5,4,3,4,2,6))
table(outlier)

# 이상치를 NA값으로 변환하기

outlier$sex <- ifelse(outlier$sex >= 3, NA, outlier$sex)
outlier$score <- ifelse(outlier$score >= 6, NA, outlier$score)

# 결측치를 제외하고 통계값 계산하기

outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(mean_score = mean(score))































