import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_ex/dio/provider/dioProvider.dart';

class DioExScreen extends StatelessWidget {
  const DioExScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DioProvider> (

      create: (_) => DioProvider()..started(),

      child: Consumer<DioProvider>(
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(title: const Text('Dio ex'),),

            body:
            NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                state.scrollListener(notification);
                return false;
              },
              child:
              ListView.builder(
                itemCount: state.modelList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // 보여줄 이미지
                            SizedBox(
                              width: state.modelList[index].width * 0.02,
                              height: state.modelList[index].height * 0.02,

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  state.modelList[index].downloadUrl,
                                  fit: BoxFit.cover,
                                  // 이미지 로딩 시 보여줄 화면
                                  loadingBuilder: (context, Widget child, ImageChunkEvent? loadingProcess) {
                                    if( loadingProcess == null ) {
                                      return child;
                                    }
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color.fromRGBO(205, 197, 197, 1)
                                      ),
                                      child: const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.amber,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("ID : ${state.modelList[index].id}"),
                                Text("Author : ${state.modelList[index].author}"),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }
              ),
            ),
          );
        },
      ),
    );
  }
}
