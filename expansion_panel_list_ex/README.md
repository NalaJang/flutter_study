# expansion_panel_list_ex

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Images

<img width="472" alt="스크린샷 2024-03-06 오후 12 10 31" src="https://github.com/NalaJang/flutter_study/assets/73895803/732b68c8-add0-4b63-887c-74c757b5d487">

* 첫 번째 Expansion panel code
-> 메뉴를 클릭해도 다른 액션은 없었다.
  
      Widget _buildPanel() {
      return ExpansionPanelList(
        expansionCallback: (index, isExpanded) {
          setState(() {
            _data[index].isExpanded = !isExpanded;
          });
        },

        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.headerValue),
              );
            },

          body: ListTile(
            title: Text(item.expandedValue),
          ),
          isExpanded: item.isExpanded
        );
      }).toList(),
      );

  <img width="400" alt="스크린샷 2024-03-06 오후 12 10 37" src="https://github.com/NalaJang/flutter_study/assets/73895803/a15b1ff0-07a0-4898-b8a4-d38c6e1aa782">


* 두 번째 Expansion panel code

      Widget _buildPanel() {
        return ExpansionPanelList.radio(
          initialOpenPanelValue: 3,
          children: _data.map<ExpansionPanelRadio>((Item item) {
            return ExpansionPanelRadio(
              value: item.id,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.headerValue),
                );
              },
  
            body: ListTile(
              title: Text(item.expandedValue),
            )
          );
        }).toList(),
      );


<img width="560" alt="image" src="https://github.com/NalaJang/flutter_study/assets/73895803/cc292fdf-439d-43c9-abc7-ec351c739c0c">

  
