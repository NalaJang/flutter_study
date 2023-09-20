class Item {
  Item({
    required this.id,
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  int id;
  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      id: index,
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}