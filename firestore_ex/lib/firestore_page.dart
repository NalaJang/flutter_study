import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStorePage extends StatefulWidget {
  const FireStorePage({Key? key}) : super(key: key);

  @override
  State<FireStorePage> createState() => _FireStorePageState();
}

class _FireStorePageState extends State<FireStorePage> {

  // CollectionReference 가 firebase 의 컬렌션 정보를 가지고 있다.
  // 이를 통해 컬렉션에 접근
  CollectionReference product = FirebaseFirestore.instance.collection('items');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cloud Firestore'),
      ),

      // StreamBuilder 를 사용해서 firestore database 와 연결해서 결과를 실시간으로 보여준다.
      body: StreamBuilder(
        // stream 을 통해 데이터를 가져온다.
        stream: product.snapshots(),
        // builder 알규먼트에서는 불러온 데이터들을 UI 에 그려주기 위한 위젯을 생성한다.
        builder: (BuildContext context,
            // 파이어스토어의 컬렌션이 QuerySnapshot 을 리턴하기 때문에
            // 제너릭 타입에 QuerySnapshot 을 넣어준다.
            AsyncSnapshot<QuerySnapshot> streamSnapshot){
          if( streamSnapshot.hasData ) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index){
                final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];

                return Card(
                  margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                  child: ListTile(
                    title: Text(documentSnapshot['name']),
                    subtitle: Text(documentSnapshot['price']),
                  ),
                );

              }
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
