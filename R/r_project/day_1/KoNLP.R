library(KoNLP)
library(dplyr)

txt <- readLines("hiphop.txt")
head(txt)

# 특수문자 제거하기
library(stringr)
txt.str_replace_all(txt, "\\w", " ")

# 명사만 출력해보기
extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다.")

# 기사에서 명사만 추출
nouns <- extractNoun(txt)

# 추출한 명사 list를 문자열 백터로 변환, 단어별 빈도표 생성
wordcount <- table(unlist(nouns))

# 데이터 프레임으로 변환
df_word <- as.data.frame(wordcount, stringsAsFactors = F)

# 변수명 수정
df_word <- rename(df_word, word = Var1, freq = Freq)

# 두 글자 이상만 출력
df_word <- filter(df_word, nchar(word)>=2)

# 빈도 순으로 정렬
top_20 <- df_word %>%
  arrange(desc(freq)) %>%
  head(20)

# 워드클라우드로 표현하기
library("wordcloud")
library("RColorBrewer")

# 색상 목록 만들기 (Dark2 색상 목록에서 8개 색상 추출)
pal <- brewer.pal(8, "Dark2")

# 난수 고정하기
set.seed(1234)

# 워드클라우드 만들기
wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 2, # 최소단어빈도
          max.words = 200, # 표현단어수
          random.order = F, #고빈도단어 중앙배치
          rot.per = .1, # 화면단어 비율
          scale = c(3, 0.2), # 단어 크기 범위
          colors = pal)



