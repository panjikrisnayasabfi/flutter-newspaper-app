import 'package:dio/dio.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter_newspaper_app/core/utils/url_util.dart';
import 'package:flutter_newspaper_app/feature/home/data/home_model.dart';

class HomeApi {
  final Dio _dio = Dio();
  Future<HomeModel> getdata() async {
    try {
      Trace customTrace =
          FirebasePerformance.instance.newTrace('load-data-from-api');
      await customTrace.start();
      Response response = await _dio.get(UrlString.baseUrlGw);
      await customTrace.stop();
      return HomeModel.fromjson(response.data);
    } catch (e) {
      return HomeModel.withError('Data not found');
    }
  }
}
