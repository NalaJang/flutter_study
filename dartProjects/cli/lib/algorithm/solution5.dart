void main() {

  List<int> cards = [1,2,3,4];
  print(solution5(cards));
}

solution5(List<int> cards) {

  for( int i = 1; i <= 5; i++ ) {
    if( !cards.contains(i) ) {
      print(i);
    }
  }
}