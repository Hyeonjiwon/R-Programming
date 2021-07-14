# 3. 데이터 구조1

################### 3.1 벡터(Vector) ###################

# 벡터 : 하나 이상의 데이터를 저장할 수 있는 1차원 저장 구조(1차원 배열)
students_age <- c(11, 12, 13, 20, 15, 21)
students_age

class(students_age)
length(students_age)

# 인덱싱 : 1부터 시작
students_age[1]
students_age[3]
students_age[-1] # 1번 인덱스의 데이터만 제외하고 추출

# 슬라이싱 : 시작 인덱스 데이터 ~ 끝 인덱스 데이터까지 접근
students_age[1:3]
students_age[4:6]

# 벡터에 데이터 추가, 갱신
score <- c(1, 2, 3)
score[1] <- 10
score[4] <- 4
score

# 벡터의 데이터 타입 : 하나의 원시 데이터 타입으로 저장
# 데이터 타입이 섞이면 하나의 타입으로 자동으로 형변환
code <- c(1, 12, "30") # 문자 타입으로 자동 변경경
class(code)
code

# 순열 생성
data <- c(1:10) # 1~10 1씩 증가시켜 생성
data

data1 <- seq(1, 10)
data1

data2 <- seq(1, 10, by = 2) # 2씩 증가시켜 생성
data2

data3 <- rep(1, times = 5) # 1 다섯번 반복 생성
data3

data4 <- rep(1:3, each = 3) # 1~3 각각 세 번씩 반복 생성
data4

################### 3.2 행렬(Matrix) ###################

# 행렬 : 2차원 데이터 저장 구조, 모두 같은 데이터 타입
var1 <- c(1, 2, 3, 4, 5, 6)

# var1을 이용해서 2행 3열 행렬을 생성, 기본적으로 열 우선으로 값이 채워짐
x1 <- matrix(var1, nrow = 2, ncol = 3)
x1

# var1을 이용해서 2열 행렬을 생성, 행의 개수는 자동 계산
x2 <- matrix(var1, ncol=2)
x2

# 일부 데이터만 접근 : 대괄호 안에 행,열 인덱스를 사용하여 일부 데이터 접근 가능 
x1[1, ] # 1행, 모든 열

x1[, 1] # 모든 행, 1열

x1[2, 2] # 2행, 2열

# 행렬에 데이터 추가
# rbind() : 행 추가 / Cbind() : 열 추가
x1

x1 <- rbind(x1, c(10, 10, 10))

x1 <- cbind(x1, c(20, 20, 20))

x1
