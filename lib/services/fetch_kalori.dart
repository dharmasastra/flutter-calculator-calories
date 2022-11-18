import 'dart:convert';

import 'package:dio/dio.dart';

Future fetchKalori(String gender, int age, int weight, int height, double activity) async {
  final Dio _dio = Dio();
  const url = "http://127.0.0.1:8005/kalori/countCalories";

  try {
    Response response = await _dio.post(
      url,
      options: Options(
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
      ),
      data: jsonEncode(<String, dynamic>{
        "gender": gender,
        "age": age,
        "weight": weight,
        "height": height,
        "activity": activity,
      }),
    );

    // print("test ${response.data['kalori']}");
    // return response.data['kalori'];
    return response.data['kalori'];
  } on DioError catch (e) {
    if (e.response != null) {
      print('Dio error!');
      print('STATUS: ${e.response?.statusCode}');
    }
  }
}
