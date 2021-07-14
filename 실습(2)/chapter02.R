# 2.1 변수
# R 변수에 데이터를 저장하고, 불러오기
age <- 20 # age 변수에 20을 저장하기 
age

age <- 30 # 저장되어 있던 20이 30으로 수정됨
age

# 첫글자를 마침표로 시작하면 두번째 글자는 숫자일 수 없다.


# 2.2 데이터 타입
# 숫자 타입
age <- 20
class(age) # 데이터 타입 확인

age <- 20L # integer
class(age)

# 문자 타입
name <- "LJI" # 또는 'LJI'
class(name)

# 논리 타입
is_effective <- T 
is_effective 


is_effective <- F
is_effective 

class(is_effective)

# 펙터 타입 : 범주형 데이터를 저장하기 위한 데이터 타입
# ("서울", "부산", "제주")의 전체 범주(factor) 중 "서울" 저장
sido <- factor("서울", c("서울","부산","제주"))
sido
class(sido) 
levels(sido) # 전체 범주(Category) 확인

# 2.3 상수
# NULL : 변수를 초기화 할 때 사용하는 상수
# NA : 결측치를 의미하는 상수
a <- NULL
jumsu <- c(NA, 90, 100)
jumsu 

# Inf : 무한대 실수를 의미하는 상수
# NaN : Not a Number를 의미하는 상수
10/0 
0/0
