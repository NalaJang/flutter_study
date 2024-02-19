import 'package:flutter/material.dart';

import '../item.dart';

class ExpansionPanelListEx extends StatefulWidget {
  const ExpansionPanelListEx({Key? key}) : super(key: key);

  @override
  State<ExpansionPanelListEx> createState() => _ExpansionPanelListExState();
}

class _ExpansionPanelListExState extends State<ExpansionPanelListEx> {
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelListEx'),
      ),

      body: SingleChildScrollView(
        child: Container(
          child: _buildPanel(),
        ),
      ),
    );
  }

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
  }
}