part of 'dog.model.dart';

Dog _$DogFromJson(Map<String, dynamic> json) {
  return Dog(
    image: json['message'] as String,
  );
}

Map<String, dynamic> _$DogImageToJson(Dog instance) => <String, dynamic>{
      'message': instance.image,
    };
