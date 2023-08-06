import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 채팅 메시지를 구독하고 있다가 보여줘야 하므로 StreamBuilder widget 사용
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('time', descending: true)
          .snapshots(),
      // AsyncSnapshot class 는 최신의 snapshot 을 가져오기 위해 꼭 필요한 요소이다.
      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if( snapshot.connectionState == ConnectionState.waiting ) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final chatDocs = snapshot.data!.docs;
        // 데이터가 전달되었을 때,
        return ListView.builder(
          // 메시지의 순서가 아래부터 위로 쌓여져 가도록 함
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (context, index) {
            // 화면에 메시지 보여주기(메시지 리스트 렌더링)
            return Text(chatDocs[index]['text']);
          },
        );
      },
    );
  }
}
