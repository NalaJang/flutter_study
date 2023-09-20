import 'package:flutter/material.dart';

import '../item.dart';

class ExpansionPanelRadioEx extends StatefulWidget {
  const ExpansionPanelRadioEx({Key? key}) : super(key: key);

  @override
  State<ExpansionPanelRadioEx> createState() => _ExpansionPanelRadioExState();
}

class _ExpansionPanelRadioExState extends State<ExpansionPanelRadioEx> {

  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelRadioEx'),
      ),

      body: SingleChildScrollView(
        child: Container(
          child: _buildPanel(),
        ),
      ),
    );
  }

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
  }
}
