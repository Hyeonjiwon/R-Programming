# 3. 데이터 구조2

################### 3.1 데이터프레임(DataFrame) ###################

# 데이터프레임 : 행과 열을 가진 2차원 저장구조
# 각 열이 서로 다른 데이터 타입을 가질 수 있음
no <- c(10, 20, 30, 40, 50, 60, 70)
age <- c(18, 15,13, 12, 10, 9, 7)
gender <- c("M", "M", "M", "M", "M", "F", "M")

# 데이터 프레임 생성 예
students <- data.frame(no, age, gender)
students

# 열의 잉름과 행의 이름 확인
# colnames() : 열 이름 / rownameS() : 행 이름
colnames(students)
rownames(students)

# 열의 이름과 행의 이름 수정
colnames(students) <- c("no", "나이", "성별")
rownames(students)<-c("A", "B", "C", "D", "E", "F", "G")

students

# 다시 돌려놓기
colnames(students) <- c("no", "age", "gender")
students

# 일부 데이터만 접근
# 열
# 1. 데이터프레임 이름 $열이름
students$no
students$age

# 2. [ , "열 이름"] 
students[, "no"]
students[, "age"]

# 3. 열 인덱스로 특정 열에 접근
students[, 1] # 1열 모두 출력
students[, 2] # 2열 모두 출력

# 행
# 1. 행 이름으로 특정 행 접근
students["A", ] # A행 데이터 출력

# 2. 행 인덱스로 특정 행 접근
students[2, ] # 2행 데이터 출력

# 한 데이터
# 1. 변수이름[행 인덱스, 열 인덱스]
students[3, 1]

# 2. 변수이름[행 이름, 열 이름]
students["A", "no"]

# 행/열 데이터 추가
# 기존에 존재하지 않는 행/열 이름 | 행/열 인덱스로 벡터를 저장
# 기존에 존재하는 열 이름 -> 데이터 갱신
students$name <- c("이용", "준희", "이훈", "서희", "승희", "하정", "하준")
students

students["H", ] <- c(80, 10, 'M', "홍길동")

################### 3.4 배열(array) ###################

# 배열 : 다차원 데이터 저장 구조, 하나의 원시 데이터 타입으로 저장
# 하나의 원시 데이터 타입으로 저장
var1 <- c(1,2,3,4,5,6,7,8,9,10,11,12 ) # 벡터 생성하기

arr1 <- array(var1, dim=c(2, 2, 3, 1)) # 2행 2열 4차원 
arr1

################### 3.5 리스트(List) ###################
# 리스트 : 키-값으로 저장 가능, 값 : 어떤 데이터 구조의 데이터도 저장가능 
v_data <- c("02-111-2222", "01022223333") 		      # 벡터
m_data <- matrix(c(21:26), nrow = 2) 			          # 행렬 
a_data <- array(c(31:36), dim = c(2, 2, 2)) 		    # 배열
d_data <- data.frame(address = c("seoul", "busan"), 
                     name = c("Lee", "Kim"), stringsAsFactors = F) # 데이터 프레임

# list(키1 = 값, 키2 = 값, …. )와 같이 키와 값 쌍으로 리스트 생성 
list_data <- list( "홍길동", 	# name 키에 “홍길동” 값 저장
                   tel = v_data, 	# tel 키에 v_data를 값으로 저장
                   score1 = m_data, 	# score1 키에 m_data를 값으로 저장
                   score2 = a_data, 	# score2 키에 a_data를 값으로 저장
                   friends = d_data) 	# friends 키에 d_data를 값으로 저장

list_data

# 리스트이름$키
list_data$name
list_data$tel

# 리스트이름[인덱스]
list_data[1]