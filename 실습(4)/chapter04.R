# 4. R 기초 프로그래밍 1

################### 4.1 연산# ##################

# 논리 연산자 
10 <= 10
10 > 5
10 >= 5

# in 연산자 : %in% 
n <- 20
n %in% (c(10, 20, 30)) # 연산자 뒤 나열한 값들 중 하나와 일치하면 참

# and 연산자 : & 
n <- 10 
n >= 0 & n <= 100

# or 연산자 : | 
n <- 1000
n >= 0 | n <=100 

# not 연산자 : ! 
!(10==5) 

# 벡터 연산 
# 벡터와 스칼라의 연산 : 벡터 안의 모든 데이터에 각각 연산이 적용
score <- c(10, 20) 
score + 2   # score 벡터의 모든 데이터에 각각 2를 더하여 반환 
score       # score 벡터 자체는 변경 x

# 연산 결과를 score 변수에 반영하려면 score에 연산 결과 저장
score <- score + 2 
score       # 연산 결과를 score에 저장 	


## 벡터와 벡터와의 연산 
score1 <- c(100,200)    
score2 <- c(90,91)    

# 벡터와 벡터의 더하기 연산
sum_score <- score1 + score2    
sum_score 

diff <- score1 - score2 
diff 

score1 <- c(100,200,300,400)    
score2 <- c(90,91)    

sum_score <- score1 + score2 
sum_score    # 100+90  200+91  300+90  400+91

score1 <- c(100,200,300,400, 500)    
score2 <- c(90,91)    

sum_score <- score1 + score2    
sum_score   # 100+90  200+91  300+90  400+91

## 행렬과 스칼라와의 연산 
m1 <- matrix(c(1,2,3,4,5,6), nrow = 2) # 2x3
m1

m1 <- m1 * 10   
m1

## 행렬과 행렬과의 연산 
m1 <- matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3) # 3x3
m2 <- matrix(c(2,2,2,2,2,2,2,2,2), nrow = 3) # 3x3
m1
m2
m1 + m2    

################### 4.2 흐름 제어문 ###################

# 조건문 : 어떤 문장들을 실행할 지 하지 않을 지를 판단하는 문장
# if 문
score <- 76

if (score >= 80) {
  print("조건이 TRUE인 경우만 수행할 문장") 
}


# if ~ else 문 
score <- 86

if(score >= 91) { 		 
  print("A") 	 
} else {
  print("B or C or D")  
}


# if ~ else if 문 
score <- 86

if (score >= 91) { print("A") 
} else if (score >= 81) { print("B")  	   
} else if (score >= 71) { print("C") 
} else if (score >= 61) { print("D") 
} else  { print ("F") }


# ifelse() 함수 
# ifelse(조건, "조건이 TRUE일 때 수행할 문장", "FALSE일 때 수행할 문장")
score <- 85 
ifelse(score >= 91,  "A",  "FALSE 일 때 수행") 

score <- 85 
ifelse(score >= 91, "A",  ifelse(score >= 81, "B", "C or D ") )

# 반복문 : 문장들이 여러 번 수행할 수 있도록 제어
# for 문
for(num in (1:3)) {
  print(num)
}

# for 문안에 if 문이나 다른 제어문을 중첩해서 사용 가능 
for (num in (1:5)) {
  if ( num %% 2 == 0)
    print(paste(num, "짝수"))
  else 
    print(paste(num, "홀수"))
} 

################### 4.3 함수 ###################

# 함수
a <- 10
a

# 함수 정의
a <- function() {
  print("test a")
  print("test a")
}

# 함수 호출
a()


# 매개변수가 있는 함수
a <- function(num) {
  print(num)
}

a(20)
a(10)

# 매개변수가 두개인 함수
a <- function(num1, num2) {
  print(paste(num1, ' ', num2)) # paste : 값들을 모두 문자열로 만들어 합쳐주는 함수
}

a(10, 20)

# 매개변수 이름을 직접써서 데이터(매개인자) 전달 
a(num1=10, num2=20)
a(num2=20, num1=10) 

# 리턴 데이터가 있는 함수  
calculator <- function (num1, op, num2) {
  result <- 0
  if (op == "+") {
    result <- num1 + num2 
    
  }else if (op == "-") {
    result <- num1 - num2 
    
  }else if (op == "*") {
    result <- num1 * num2 
    
  }else if (op == "/") {
    result <- num1 / num2
    
  } 
  return (result)
}

# calculator()로부터 반환받은 3을 저장
n <- calculator(1,"+",2)    
print(n) 

# calculator()로부터 반환받은 -1을 저장
n <- calculator(1,"-",2)    	
print(n) 