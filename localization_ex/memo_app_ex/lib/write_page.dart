import 'package:flutter/material.dart';
import 'package:memo_app_ex/repository/db_helper.dart';

import 'MemoList.dart';

class WritePage extends StatelessWidget {

  String title = '';
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                saveDB();
              },
              icon: Icon(Icons.save)
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: (String title) {
                this.title = title;
              },
              decoration: InputDecoration(
                  hintText: 'memo title'
              ),
            ),
            Padding(padding: EdgeInsets.all(10)
            ),
            TextField(
              onChanged: (String title) {
                this.title = title;
              },
              decoration: InputDecoration(
                  hintText: 'new memo'
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveDB() async {
    DBHelper dbHelper = DBHelper();
    var memo = Memo (
      // id: 3,
      title: this.title,
      text: this.text,
      createdTime: DateTime.now().toString(),
      editedTime: DateTime.now().toString()
    );

    await dbHelper.insertMemo(memo);
    print('저장저장');
  }
}
