import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({required this.index, Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Card(
        // 앱에서 랜덤으로 이미지를 불러올 수 있는 주소
        child: Image.network(
          'https://source.unplash.com/random?sig=$index',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
