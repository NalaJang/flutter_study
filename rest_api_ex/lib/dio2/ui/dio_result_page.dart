import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_ex/dio2/config/custom_log_interceptor.dart';
import 'package:rest_api_ex/dio2/data/model/colorListResponse.dart';
import 'package:rest_api_ex/dio2/data/source/rest_client.dart';

import '../data/model/colorModel.dart';

class DioResultPage extends StatelessWidget {
  DioResultPage({super.key});

  final dio = Dio()..interceptors.add(CustomLogInterceptor());

  @override
  Widget build(BuildContext context) {
    final client = RestClient(dio);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio, Retrofit Ex'),
      ),

      body: FutureBuilder<ColorListResponse>(
        future: client.getColorList(id: 1),
        builder: (context, snapshot) {
          if( snapshot.hasData ) {
            ColorListResponse? colorList = snapshot.data;

            if( colorList != null ) {
              ColorModel color = colorList.data;
              List<String> colorSplit = color.color.split('#');
              String colorValue = colorSplit[1].trim();
              print('colorValue > ${colorValue}');

              return Column(
                children: [
                  Text(color.id.toString()),
                  Text(color.pantoneVale.toString()),
                ],
              );
            }
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
