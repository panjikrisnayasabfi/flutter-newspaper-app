import 'package:dio/dio.dart';
import 'package:flutter_newspaper_app/core/utils/url_util.dart';
import 'package:flutter_newspaper_app/feature/home/data/home_model.dart';

class HomeApi {
  final Dio _dio = Dio();
  Future<HomeModel> getdata() async {
    try {
      Response response = await _dio.get(UrlString.baseUrlGw);
      return HomeModel.fromjson(response.data);
    } catch (e) {
      return HomeModel.withError('Data not found');
    }
  }
}
