/*
 <다트 비만도 계산기>
  // 나이는 정수
  나이를 입력하세요.

  // 성별은 ‘남자’, ‘여자’
  성별을 입력하세요.

  // 키는 정수 또는 실수
  키를 입력하세요.

  // 몸무게는 정수 또는 실수 일 수 있다
  몸무게를 입력하세요.

  // 신체질량지수 BMI 계산하는 함수를 검색해서
  // 작성하고 결과값을 아래 형식에 맞게 표시.

  당신은 (저체중, 정상, 과체중, 비만) 입니다.
*/
import 'dart:io';

void main() {

  print('나이를 입력하세요.');
  int age = int.parse(stdin.readLineSync()!);

  print('성별을 입력하세요.');
  String gender = stdin.readLineSync()!;

  print('키를 입력하세요.');
  double height = double.parse(stdin.readLineSync()!) /100;

  print('몸무게를 입력하세요.');
  double weight = double.parse(stdin.readLineSync()!);

  double myBMI = calculateBMI(weight, height);
  String result = calculateBMIResult(myBMI);

  print('당신은 $result 입니다.');

}

double calculateBMI(double weight, double height) {
  double result = weight / (height * height);
  return result;
}

String calculateBMIResult(double myBMI) {
  String result = '';

  if( myBMI < 18.5 ) {
    result = '저체중';
  } else if( myBMI < 24.9 ) {
    result = '표준';
  } else if( myBMI < 29.9 ) {
    result = '과체중';
  } else if( myBMI < 34.9 ) {
    result = '비만';
  } else if( 35 < myBMI ) {
    result = '고도 비만';
  }

  return result;
}
