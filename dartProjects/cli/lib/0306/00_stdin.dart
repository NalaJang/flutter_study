import 'dart:io';

void main() {

  print("Enter your name?");
  // stdin : 키보드 입력 받는 코드
  String name = stdin.readLineSync()!;

  // """ """ 문자열 출력
  print("""그가 "Hello, '$name', Welcome!!" 라고 말했다.""");
  // 출력 결과
  // Enter your name?
  // Nala
  // 그가 "Hello, 'Nala', Welcome!!" 라고 말했다.

  user('홍길동');
  user('철수', age: 24, hobby: '농구');
  user2('미미', age: 44, hobby: '발레');
}

void user(String name, {int age = 0, String hobby = ''}) {}

void user2(String name, {required int age, required String hobby}) {}