a <- 1
1 -> c
# 변수명은 관례적으로 '낙타기법'을 사용
# goto and => gotoAnd
# goto and play => gotoAndPlay

# 여러 개의 데이터를 저장하는 변수
# c() => combine

var1 <- c(1, 2, 5, 7, 8)
var2 <- c(1:5)
var3 <- seq(1, 5)
var4 <- c(1.1, 2, 5, 7, 8)
var5 <- seq(1, 10, by = 2.1)

# 변수와 숫자간 연산 가능

var4 + 2 
var4 * 2

# 변수간 연산 가능

var3 * var4
var3 / var4

# 변수에 문자 할당 : 문자는 ""로 감싸줌

str1 <- c("toy", 2, 3)
str2 <- c("toy", "story")
str4 <- c(1,2 "toy")
# Error: unexpected string constant in "str4 <- c(1,2 "toy""
str1 * 2
# Error in str1 * 2 : non-numeric argument to binary operator

### 기본 라이브러리 함수
# 평균
mean(var1)
# 최대값
max(var1)
# 최소값
min(var1)

# 문자열 합산, 구분자 지정
str2
paste(str2)
str3 <- paste(str2, collapse=" ")

# 패키지 설치
install.packages("패키지 명")

# 설치 패키지 로드 함수
# library(라이브러리 명)

x <- c("a", "a", "b", "c")
qplot(x)

# mpg 데이터

qplot(data = mpg, x = cty)
qplot(data = mpg, x = drv, y = hwy)
qplot(data = mpg, x = drv, y = hwy, geom = 'line')
qplot(data = mpg, x = drv, y = hwy, geom = 'boxplot')
qplot(data = mpg, x = drv, y = hwy, geom = 'boxplot', colour = drv)

# 데이터 프레임

english <- c(90, 80, 60, 70)
math <- c(50, 60, 100,20)
df_midterm <- data.frame(english, math)

class <- c(1, 1, 2, 2)
df_midterm <- data.frame(english, math, class)

mean(df_midterm$english)
max(df_midterm$math)

# 데이터 프레임 생성2

df_midterm2 <- data.frame(english = c(90, 80, 60, 70),
                          math = c(50, 60, 100,20),
                          class = c(1, 1, 2, 2))

# 데이터 프레임 생성2
# 외부데이터를 읽어서 생성

install.packages("readxl")
library(readxl)
# 작업 폴더 내의 데이터는 경로설정 하지 않아도 됨 (\아님!)
df_exam <- read_excel("C:/r_project/data/excel_exam.xlsx")

# 첫번째 행이 열의 이름이 아닌 경우, col_names = F
df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)

# 엑셀의 특정 sheet 읽기
df_exam_novar <- read_excel("excel_exam_sheet.xlsx", sheet = 3)

# csv 파일 읽기
# 첫번째 행이 열의 이름이 아닌 경우, header = F
df_csv <- read.csv("csv_exam.csv", header = F)

# CSV 파일 내에 문자가 포함되어 있을 경우,
df_csv_exam <- read.csv("csv_exam.csv", stringsAsFactors = F)

# 데이터프레임을 CSV로 저장하기
write.csv(df_midterm, file = "df_midterm.csv")

# 데이터프레임을 RDS로 저장하기
saveRDS(df_midterm, file = "df_midterm.rds")

# RDS 파일 불러오기
df_midterm <- readRDS("df_midterm.rds")





