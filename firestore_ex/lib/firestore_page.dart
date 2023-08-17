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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  // 비동기 방식이므로 void
  Future<void> _update(DocumentSnapshot documentSnapshot) async {
    // 현재의 데이터 값이 담겨있다.
    nameController.text = documentSnapshot['name'];
    priceController.text = documentSnapshot['price'];

    await showModalBottomSheet(
      // isScrollControlled: 기본 높이 조절
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context){
          return SizedBox(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                // MediaQuery : 키보드에 반응하는 위젯을 만들기 위함
                // viewInsets.bottom : 키보드가 올라왔을 때 키보드 위에 창이 위치한다.
                bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  TextField(
                    // 변한 데이터 값이 담긴다
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name'
                    ),
                  ),

                  TextField(
                    // 변한 데이터 값이 담긴다
                    controller: priceController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        labelText: 'Price'
                    ),
                  ),

                  SizedBox(height: 20,),

                  ElevatedButton(
                    onPressed: () async {

                      // 변한 데이터 값을 두 변수에 담긴다.
                      final String name = nameController.text;
                      final String price = priceController.text;
                      
                      await product
                          // 정확한 row 를 지정해주고
                          .doc(documentSnapshot.id)
                          // 필드를 지정해준다.(변한 값은 최종적으로 update()에 전달된다.
                          .update({"name":name, "price":price});

                      nameController.text = "";
                      priceController.text = "";

                      // 업데이트 작업이 끝난 후 showModalBottomSheet 사라지도록.
                      Navigator.of(context).pop();
                    },
                    child: Text('Update')
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  Future<void> _create() async {

    await showModalBottomSheet(
      // isScrollControlled: 기본 높이 조절
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context){
          return SizedBox(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  // MediaQuery : 키보드에 반응하는 위젯을 만들기 위함
                  // viewInsets.bottom : 키보드가 올라왔을 때 키보드 위에 창이 위치한다.
                  bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  TextField(
                    // 새 데이터 값이 담긴다
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: 'Name'
                    ),
                  ),

                  TextField(
                    // 새 데이터 값이 담긴다
                    controller: priceController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        labelText: 'Price'
                    ),
                  ),

                  SizedBox(height: 20,),

                  ElevatedButton(
                      onPressed: () async {

                        // 새 데이터 값이 두 변수에 담긴다.
                        final String name = nameController.text;
                        final String price = priceController.text;

                        await product.add(
                            {'name':name, 'price':price}
                        );

                        nameController.text = "";
                        priceController.text = "";

                        // 업데이트 작업이 끝난 후 showModalBottomSheet 사라지도록.
                        Navigator.of(context).pop();
                      },
                      child: Text('Update')
                  )
                ],
              ),
            ),
          );
        }
    );
  }


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
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              _update(documentSnapshot);
                            },
                            icon: Icon(Icons.edit),
                          )
                        ],
                      ),
                    ),
                  ),
                );

              }
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),

      // 새 아이템 추가
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){

          _create();

        },
        child: Icon(Icons.add),
      ),
    );
  }
}
