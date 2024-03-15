import 'dart:io';
/*
     <구구단 계산기>
    // 숫자를 입력받아서 구구단을 출력한다.
    숫자를 입력하세요.

    // 3입력시 아래와 같이 출력한다.
    3, 6, 9, 12, 15, 18, 21, 24, 27
 */
void main() {

  print('숫자를 입력하세요.');
  int number = int.parse(stdin.readLineSync()!);
  multiplicationTable(number);
}

void multiplicationTable(int number) {

  List<String> result = [];

  for( int i = 1; i <= 9; i++ ) {
    int value = number * i;
    result.add(value.toString());

    if( i < 9 ) {
      result.add(', ');
    } else {
      result.add('\n');
    }
  }

  print(result.join(''));
}