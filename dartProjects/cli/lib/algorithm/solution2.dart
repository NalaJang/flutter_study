void main() {

  print(solution2(30, 15));
  print(solution2(12, 40));
}

String solution2(int a, int b) {
  String result = '';

  if( (a % 2 == 0 && b % 2 == 1) || (a % 2 == 1 && b % 2 == 0) ) {
    result = 'YES';
  } else {
    result = 'NO';
  }

  return result;
}