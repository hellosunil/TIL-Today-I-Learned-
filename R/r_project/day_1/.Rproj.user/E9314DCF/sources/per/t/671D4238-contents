raw_welfare <- read.spss(file="Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)
welfare <- raw_welfare
head(welfare)
summary(welfare)

welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)




# 성별에 따른 월급 차이 분석해보기

# 값 분포 확인
class(welfare$sex)

# 이상치 확인
table(welfare$sex)

# 성별 항목 전처리

welfare$sex <- ifelse(welfare$sex ==1, "male", "female")
table(welfare$sex)
qplot(welfare$sex)

# 월급 변수 전처리

class(welfare$income)
summary(welfare$income)
qplot(welfare$income) + xlim(0, 1000)

# 이상치 확인
summary(welfare$income)

# 이상치 결측 처리
welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)

# 결측치 확인
table(is.na(welfare$income))

# 성별 월급 평균표 만들기

sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

ggplot(data = sex_income, aes(x=sex, y=mean_income)) + geom_col()









# 나이에 따른 월급 비교해보기

class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)

# 이상치 확인
summary(welfare$birth)

#결측치 확인
table(is.na(welfare$birth))

# 파생변수 만들기 - 나이
welfare$age <- 2015 - welfare$birth + 1
summary(welfare$age)
qplot(welfare$age)

# 나이에 따른 월급 평균표 만들기
age_income  <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))

head(age_income)

# 그래프 만들기
ggplot(data = age_income, aes(x=age, y=mean_income)) + geom_line()




# 연령대별 월급차이 분석하기

# 파생변수 만들기
welfare <- welfare %>%
  mutate(ageg = ifelse(age < 30, "young", ifelse(age <= 59, "middle", "old")))
table(welfare$ageg)
qplot(welfare$ageg)

# 분석
ageg_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))

ageg_income
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + 
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))




# 연령대 및 성별 월급 평균 비교해보기

sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg, sex) %>%
  summarise(mean_income = mean(income))

# 그래프로 표현하기

ggplot(data=sex_income, aes(x=ageg, y=mean_income, fill = sex)) +
  geom_col(position = "dodge") +
  scale_x_discrete(limits = c("young", "middle", "old"))


# 성별 연령별 월급 평균표 만들기
sex_age <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age, sex) %>%
  summarise(mean_income = mean(income))

head(sex_age)

# 그래프 그리기
ggplot(data = sex_age, aes(x = age, y = mean_income, col = sex)) + geom_line()




# 직업별 월급 차이 분석해보기

class(welfare$code_job)
table(welfare$code_job)

library(readxl)
list_job <- read_excel("Koweps_Codebook.xlsx", col_names = T, sheet = 2)
head(list_job)
dim(list_job)


# job_code와 직업명 결합하기

welfare <- left_join(welfare, list_job, id="code_job")

# 결합이 잘 됐는지 확인해보기
welfare %>%
  filter(!is.na(code_job)) %>%
  select(code_job, job) %>%
  head(10)

# 결측값 제거하기
job_income <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))

head(job_income)

# 상위 10개 추출하기
top10 <- job_income %>%
  arrange(desc(mean_income)) %>%
  head(10)

# 그래프로 그려보기
ggplot(data=top10, aes(x= reorder(job, mean_income), y=mean_income)) + 
  geom_col() +
  coord_flip() #글자 겹쳐서 90도 회전전

# 하위 10개 추출하기
bottom10 <- job_income %>%
  arrange(mean_income) %>%
  head(10)

# 그래프로 그려보기
ggplot(data=bottom10, aes(x=reorder(job, -mean_income), y=mean_income))+
  geom_col() +
  coord_flip() +
  ylim(0,850)





# 성별 직업 빈도 확인하기

# 남성 직업 빈도 상위 10개 추출
job_male <- welfare %>%
  filter(!is.na(job) & sex == "male") %>%
  group_by(job) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)

# 여성 직업 빈도 상위 10개 추출
job_female <- welfare %>%
  filter(!is.na(job) & sex == "female") %>%
  group_by(job) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)


# 그래프로 표현하기
ggplot(data=job_male, aes(x=reorder(job, n), y=n)) +
  geom_col() +
  coord_flip()

ggplot(data=job_female, aes(x=reorder(job, n), y=n)) +
  geom_col() +
  coord_flip()




# 종교 유무에 따른 이혼률 분석해보기

# 변수 검토(종교)
class(welfare$religion)
table(welfare$religion)

welfare$religion <- ifelse(welfare$religion ==1, "yes", "no")
table(welfare$religion)
qplot(welfare$religion)

# 변수 검토(결혼)
class(welfare$marriage)
table(welfare$marriage)

welfare$group_marriage <- ifelse(welfare$marriage ==1, "marriage",
                                 ifelse(welfare$marriage ==3, "divorce", NA))

qplot(welfare$group_marriage)

# 종교에 따른 이혼율 분석하기
religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(religion, group_marriage) %>%
  summarise(n=n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))

# 이혼 추출
divorce <- religion_marriage %>%
  filter(group_marriage == "divorce") %>%
  select(religion, pct)
ggplot(data=divorce, aes(x=religion, y=pct)) + geom_col()



# 연령대 및 종교 유무에 따른 이혼율 분석

# 연령대별 이혼율 표 만들기
ageg_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(ageg, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))

# 초년 제외, 이혼 추출
ageg_divorce <- ageg_marriage %>%
  filter(ageg != "young" & group_marriage == "divorce") %>%
  select(ageg, pct)

# 그래프 만들기
ggplot(data=ageg_divorce, aes(x=ageg, y=pct)) + geom_col()




# 연령대 및 종교 유무에 따른 이혼율 분석하기

ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != "young") %>%
  group_by(ageg, religion, group_marriage) %>%
  summarise(n =n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))

# 연령대 및 종교 유무별 이혼율 표 만들기

df_divorce <- ageg_religion_marriage %>%
  filter(group_marriage == "divorce") %>%
  select(ageg, religion, pct)

ggplot(data=df_divorce, aes(x=ageg, y=pct, fill=religion)) +
  geom_col(position = "dodge")






# 지역별 연령대 비율 분석하기

# 변수 검토하기
class(welfare$code_region)
table(welfare$code_region)

# 지역 코드 목록 만들기
list_region <- data.frame(code_region = c(1:7),
                          region = c("서울",
                                     "수도권",
                                     "부산/경남/울산",
                                     "대구/경북",
                                     "대전/충남",
                                     "강원/충북",
                                     "광주/전남/전북/제주도"))

# 지역명 변수추가
welfare <- left_join(welfare, list_region, id="code_region")

welfare %>%
  select(code_region, region) %>%
  head

# 지역별 연령대 비율표 만들기
region_ageg <- welfare %>%
  count(region, ageg) %>% #첫번째 변수별 두번째 인자값 카운트
  group_by(region) %>%
  mutate(pct = round(n/sum(n)*100, 2))

# 그래프로 표현하기
ggplot(data=region_ageg, aes(x=region, y=pct, fill=ageg)) +
  geom_col() +
  coord_flip()


# 노년층 비율 높은 순으로 막대 정렬하기
# 노년층 비율 내림차순 정렬
list_order_old <- region_ageg %>%
  filter(ageg == "old") %>%
  arrange(pct)

order <- list_order_old$region

ggplot(data=region_ageg, aes(x=region, y=pct, fill=ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits=order) # limits 순으로 정렬(limits = c(1,2,3))


# 연령 순으로 막대 나열하기
class(region_ageg$ageg)

# factor()와 level로 순서 지정하기
region_ageg$ageg <- factor(region_ageg$ageg,
                           level = c("old", "middle", "young"))

levels(region_ageg$ageg) # ==> levels 지정하면, 자동으로 적용됨
