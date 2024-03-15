void main() {

  int length = 2;
  List<String> aa = ['aa', 'hello', 'bb'];
  print(solution3(length, aa));
}

String solution3(int length, List<String> strings) {

  for( int i = 0; i < length; i++ ) {
    strings.add(strings[i]);
  }

  String result = 'Hello ${strings.join(',')}.\n';
  return result;
}