import 'package:flutter/material.dart';

import 'image_widget.dart';

class ScrollEffect extends StatelessWidget {
  const ScrollEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // slivers 란 하나의 스크롤링을 의미하는 것이기 때문에
        // 이 slivers 알규먼트를 통해서 여러 개의 스크롤링을 나열, 구현할 수 있다.
        slivers: [
          SliverAppBar(
            title: Text('Sliver appBar',),
            backgroundColor: Colors.blueGrey,
            expandedHeight: 200,
            leading: Icon(Icons.arrow_back),
            actions: [
              Icon(Icons.settings),
              SizedBox(width: 12,)
            ],

            // appBar 배경 이미지 추가
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/fruit.png',
                // 이미지 꽉 채우기
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
                ),
                itemCount: 20,
                // GridView.builder 위젯을 스크롤시키기 위해서
                // primary: false, shrinkWrap: true 를 준다.
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ImageWidget(index: index,);
                }
            ),
          )
        ],
      ),
    );
  }
}
