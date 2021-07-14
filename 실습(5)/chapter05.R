# 5. R을 이용한 데이터 조작방법1

# 5.1 데이터의 대략적인 특징 파악

# head() : 첫번째 행부터 6번째 행까지 추출
# 매개인자 = 데이터, 매개인자2 = 추출할 행 개수
head(Orange)
head(Orange, 3)

# tail() : 마지막 행부터 6개의 행까지 추출
# 매개인자 = 데이터, 매개인자2 = 추출할 행 개수
tail(Orange)
tail(Orange, 3)

# str() : 데이터의 대략적인 구조를 파악할 수 있음
str(Orange)

# summary() 
# 수치형 데이터의 각 컬럼(변수) 별 최소값(Min), 1사분위 수(1st Qu), 중앙값(Median), 3사분위 수(3rd Qu), 최대값(Max), 평균(Mean)을 구할 수 있음 
# 범주형(factor) 데이터의 경우는 각 범주벼롤 관측치 개수를 구할 수 있음
summary(Orange)

# 5.2 외부 파일 읽기

# read.csv() 

# nihs <- read.csv("data/NHIS_OPEN_GJ_EUC-KR.csv") -> 인코딩 안해주면 오류남 

# 문자 인코딩 지정: fileEncoding = "EUC-KR", "UTF-8"
nihs <- read.csv("/data/NHIS_OPEN_GJ_EUC-KR.csv", fileEncoding="UTF-8") # macos
nihs <- read.csv("data/NHIS_OPEN_GJ_EUC-KR.csv", fileEncoding="EUC-KR")
head(nihs)

# 첫번째 행에 열 이름이 없이 데이터부터 존재할 때 header = F
#  문자열 데이터를 범주형 데이터로 읽기를 원할 때 stringsAsFactor = TRUE
sample <- read.csv("data/sample.csv", header = F, fileEncoding = "EUC-KR", stringsAsFactor = TRUE)
str(sample)

# 엑셀 파일 불러오기
# openxlsx 패키지 설치 후 로드
install.packages('openxlsx') # openxlsx 패키지 설치
library(openxlsx) # openxlsx 패키지 불러오기 / 라이브러리 호출해줘야 함

# 디폴트로 엑셀 파일의 첫번째 sheet를 읽음
nhis_sheet1 <- read.xlsx("data/NHIS_OPEN_GJ_EUC-KR.xlsx")
head(nhis_sheet1)

# 두번째 sheet를 읽음
nhis_sheet2 <- read.xlsx("data/NHIS_OPEN_GJ_EUC-KR.xlsx", sheet=2)
head(nhis_sheet2)

# 빅데이터 파일 불러오기
# data.table() 패키지의 fread() 는 빠른 속도로 데이터를 읽어 올 수 있음

install.packages('data.table') # data.table 패키지 설치
library(data.table) # data.table 패키지 불러오기

# fread() 를 이용하여 대용량 csv 파일을 읽어옴 
nihs_bigdata <- read.csv("data/NHIS_OPEN_GJ_BIGDATA_UTF-8.csv", fileEncoding="UTF-8")
str(nihs_bigdata)

# 5.3 데이터 추출

# 행 제한 
# 행 인덱스를 이용하여 행 제한
Orange[1, ] # 1행만 추출
Orange[1:5, ] # 1~5행
Orange[6:10, ] # 6~10행
Orange[c(1, 5), ] # 1, 5행
Orange[-c(1:29), ] # 1, 29행을 제외한 모든 행

# 데이터를 비교하여 행 제한 
Orange[Orange$age == 118, ]  #age 열의 데이터가 118인 행만 추출
Orange[Orange$age %in% c(118, 484), ] # age 열의 데이터가 118 또는 484인 행만 추출
Orange[Orange$age >= 1372, ] # age 열의 데이터가 1372와 같거나 큰 행만 추출

# 열 제한 
# 열 이름을 이용하여 열 제한 : 추출할 열(변수)이름을 대괄호 안 콤마(,) 뒤에 작성
Orange[, "circumference"] # Orange의 circumference 열만 추출, 모든 행 추출
Orange[1, c("Tree", "circumference")]  # Orange의 Tree와 circumference 열만 추출, 1행 추출

# 열 인덱스를 이용하여 열 제한
Orange[ , 1]  # 1열
Orange[ , c(1,3)] # 1, 3열
Orange[ , c(1:3)] # 1~3열
Orange[ , -c(1,3)] # 1, 3열을 제외한 열

# 행과 열 제한
Orange[1:5, "circumference"] # 1~5행, circumference 열 추출
Orange[Orange$Tree %in% c(3, 2), c("Tree", "circumference")] # 3 또는 2행의 Tree 열과 circumference 열

# 정렬 : order()
OrangeT1 <- Orange[Orange$circumference <50, ]
OrangeT1

# circumference 값을 기준으로 오름차순 정렬
OrangeT1[order(OrangeT1$circumference), ]

# circumference 값을 기준으로 내림차순 정렬
OrangeT1[order(-OrangeT1$circumference), ] 

# 그룹별 집계 : aggregate()
# 집계할 데이터 열 이름 ~ 그룹핑할 기준 열 이름,  데이터프레임, 
aggregate(circumference ~ Tree, Orange, mean) # Tree 컬럼의 값이 같은 행을 묶은 후, circumference 값의 평균을 구함

# 5.4 데이터 구조 변경

# 데이터 병합
# 열 방향 : mearge(), cbind()
## 데이터 준비 
stu1 <- data.frame( no = c(1,2,3),  midterm = c(100,90,80)) 
stu2 <- data.frame( no = c(1,2,3),  finalterm = c(100,90,80)) 
stu3 <- data.frame( no = c(1,4,5),  quiz = c(99,88,77)) 
stu4 <- data.frame( no = c(4,5,6),  midterm = c(99,88,77))  

# merge() : 동일 컬럼명의 동일 데이터 행끼리 병합
merge(stu1, stu2)
merge(stu1, stu3) # 컬럼 값이 동일하지 않으면 제외

# all = TRUE 옵션을 사용하면 컬럼 값이 일치하지 않는 행도 병합 결과에 포함, SQL의 외부 조인(full outer join)과 유사
merge(stu1, stu3, all = TRUE)

# rbind() : 행 합치기, 컬럼 명이 동일해야 함
rbind(stu1, stu4)

# cbind( ) : 열 합치기
cbind(stu1, stu2)