import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_ex/http/provider/httpProvider.dart';

class HttpEx extends StatelessWidget {
  const HttpEx({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HttpProvider> (

      create: (_) => HttpProvider()..getPhotos(),

      child: Consumer<HttpProvider>(
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(title: const Text('Http ex'),),

            body: ListView.builder(
              itemCount: state.modelList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(state.modelList[index].id),
                );
              }
            ),
          );
        },
      ),
    );
  }
}
