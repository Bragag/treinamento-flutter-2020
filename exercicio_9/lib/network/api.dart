import 'package:dio/dio.dart';
import 'package:exercicio_9/models/dog.model.dart';

class Api {
  static Future<Dog> getDog(String breed) async {
    Dio dio = Dio();
    breed.toLowerCase();
    dio.options.baseUrl = 'https://dog.ceo/api/breed/';

    try {
      Response response = await dio.get('/$breed/images/random');

      return Dog.fromJson(response.data);
    } on DioError catch(e) {
      return Dog(image: 'https://fotos.amomeupet.org/uploads/fotos/1300x0_1568662224_5d7fe2d09bccd.jpeg');
    }
  }

  static Future<Dog> getFeaturedDog() async {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://dog.ceo/api/breeds/';

      Response response = await dio.get('image/random');

      return Dog.fromJson(response.data);
  }
}
