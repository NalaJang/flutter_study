import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';

class ChatBubbles extends StatelessWidget {
  const ChatBubbles(this.message, this.userName, this.isMe, {Key? key}) : super(key: key);

  final String message;
  final String userName;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,

      children: [
        // 내가 보낸 메시지
        if( isMe )
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,5,0),
            child: ChatBubble(
              clipper: ChatBubbleClipper8(type: BubbleType.sendBubble),
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 20),
              backGroundColor: Colors.blue,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),

                child: Column(
                  // 이름 정렬
                  crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,

                  children: [
                    // 사용자 이름
                    Text(
                      userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),

                    // 사용자 메시지
                    Text(
                      message,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),

        // 상대가 보낸 메시지
        if( !isMe )
          Padding(
            padding: const EdgeInsets.fromLTRB(5,0,0,0),
            child: ChatBubble(
              clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
              backGroundColor: Color(0xffE7E7ED),
              margin: EdgeInsets.only(top: 20),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),

                child: Column(
                  // 이름 정렬
                  crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,

                  children: [
                    // 사용자 이름
                    Text(
                      userName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),

                    // 사용자 메시지
                    Text(
                      message,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }
}
