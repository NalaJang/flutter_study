void main() {

  print(solution4(3, 3));
}

String solution4(int a, int b) {

  List<String> result = [];

  for(int i = a; i < 10; i++ ) {
    int term = a + (i * b);
    result.add(term.toString());

    if( i < 9 ) {
      result.add(' ');
    } else {
      result.add('\n');
    }
  }

  return result.join('');
}