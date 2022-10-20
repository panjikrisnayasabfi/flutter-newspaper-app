import 'package:flutter_newspaper_app/feature/home/data/home_model.dart';
import 'package:flutter_newspaper_app/feature/home/domain/api/home_api.dart';

class HomeRepo {
  HomeApi _homeApi = HomeApi();
  Future<HomeModel> fectnewslist() {
    return _homeApi.getdata();
  }
}
