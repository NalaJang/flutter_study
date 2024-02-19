import 'package:flutter/material.dart';
import 'package:memo_app_ex/repository/db_helper.dart';
import 'package:memo_app_ex/write_page.dart';

void main() {
  runApp(const MemoList());
}

class MemoList extends StatefulWidget {
  const MemoList({Key? key}) : super(key: key);

  @override
  State<MemoList> createState() => _MemoListState();
}

class _MemoListState extends State<MemoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              child: Text('memo'),
            ),
          ),
          Expanded(
              child: memoBuilder()
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => WritePage()));
          },
          label: Text('add memo')
      ),
    );
  }

  Widget memoBuilder() {
    return FutureBuilder<List<Memo>>(
      builder: (context, snapshot) {
      if( !snapshot.hasData || snapshot.data!.isEmpty ) {
        return Center(
          child: Text('메모 추가하기'),
        );

      } else {
        return ListView.builder(
          itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Memo memo = snapshot.data![index];
              return Container(
                height: 90,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                          memo.title
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      child: Text(
                          memo.text
                      ),
                      alignment: Alignment.topLeft,
                    )
                  ],
                ),
              );
            }
        );
      }
    },
    );
  }
}


class Memo {
  // final int id;
  final String title;
  final String text;
  final String createdTime;
  final String editedTime;

  Memo({required this.title, required this.text, required this.createdTime, required this.editedTime});

  Map<String, dynamic> toMap() {
    return {
      // 'id' : id,
      'title' : title,
      'text' : text,
      'createdTime' : createdTime,
      'editedTime' : editedTime
    };
  }
}


