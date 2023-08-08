import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  const AddImage({Key? key}) : super(key: key);

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {

  File? pickedImage;

  void _pickImage() async {
    final imagePicker = ImagePicker();
    // pickImage: XFile 타입으로 future 를 return 한다.
    // XFile: 파일 임시 저장 위치에 대한 정보(카메라로 찍은 이미지의 임시 저장 경로를 불러올 수 있다.)
    final pickedImageFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxHeight: 150
    );

    setState(() {
      if( pickedImageFile != null ) {
        pickedImage = File(pickedImageFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: 150,
      height: 300,

      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue,
            backgroundImage: pickedImage != null ? FileImage(pickedImage!) : null,
          ),

          SizedBox(height: 10,),

          // 이미지 추가
          OutlinedButton.icon(
              onPressed: (){
                _pickImage();
              },
              icon: Icon(Icons.image),
              label: Text('Add icon')
          ),

          SizedBox(height: 80),

          // 닫기
          TextButton.icon(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
              label: Text('Close')
          )
        ],
      ),
    );
  }
}
