import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {

  final _controller = TextEditingController();
  var _userEnterMessage = '';

  void _sendMessage() {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    
    FirebaseFirestore.instance.collection('chat').add({
      'text' : _userEnterMessage,
      'time' : Timestamp.now(),
      'userID' : user!.uid
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          // TextField 도 Expanded widget 으로 감싸준다.
          Expanded(
            child: TextField(
              // 장문의 메시지를 입력하면 자동으로 줄바꿈
              maxLines: null,
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Send a message...'
              ),

              // 사용자가 메시지를 입력할 때마다 _userEnterMessage 값이 update
              onChanged: (value){
                setState(() {
                  _userEnterMessage = value;
                });
              },
            ),
          ),
          IconButton(
            // 메서드 뒤에 괄호가 붙는 경우: 해당 메서드가 실행된 후 메서드의 값이 리턴된다는 의미
            // _sendMessage 처럼 괄호없이 메서드 이름만 쓰는 경우: onPressed 메서드가 해당 메서드의 위치를 참조할 수 있다는 의미
            // 즉, onPressed 매개 변수에 _sendMessage 메서드 대한 포인터(참조)를 전달한다는 의
            onPressed: _userEnterMessage.trim().isEmpty ? null : _sendMessage,
            icon: Icon(Icons.send),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
