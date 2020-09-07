import 'package:dio/dio.dart';
import 'package:exercicio_10/models/brand.model.dart';
import 'package:exercicio_10/models/car-detail.model.dart';
import 'package:exercicio_10/models/car-year.model.dart';
import 'package:exercicio_10/models/car.model.dart';

class Api {
  static Future<List<Brand>> getBrands(String type) async {
    Dio dio = new Dio();
    dio.options.baseUrl = 'https://fipeapi.appspot.com/api/1/';

    try {
      Response response = await dio.get('$type/marcas.json');

      var brandList =
          (response.data as List).map((i) => Brand.fromJson(i)).toList();

      return brandList;
    } on DioError catch (e) {
      throw e;
    }
  }

  static Future<List<CarModel>> getModels(String type, int brand) async {
    Dio dio = new Dio();
    dio.options.baseUrl = 'https://fipeapi.appspot.com/api/1/';

    try {
      Response response = await dio.get('$type/veiculos/$brand.json');

      var modelList =
          (response.data as List).map((i) => CarModel.fromJson(i)).toList();

      return modelList;
    } on DioError catch (e) {
      throw e;
    }
  }

  static Future<List<CarYear>> getYears(
      String type, int brand, String model) async {
    Dio dio = new Dio();
    dio.options.baseUrl = 'https://fipeapi.appspot.com/api/1/';

    try {
      Response response = await dio.get('$type/veiculo/$brand/$model.json');

      var yearList =
          (response.data as List).map((i) => CarYear.fromJson(i)).toList();

      return yearList;
    } on DioError catch (e) {
      throw e;
    }
  }

  static Future<CarDetail> getCarDetails(
      String type, int brandId, String modelId, String yearId) async {
    Dio dio = new Dio();
    dio.options.baseUrl = 'https://fipeapi.appspot.com/api/1/';

    try {
      Response response =
          await dio.get('$type/veiculo/$brandId/$modelId/$yearId.json');

      var carDetail = CarDetail.fromJson(response.data);

      return carDetail;

    } on DioError catch (e) {
      throw e;
    }
  }
}
