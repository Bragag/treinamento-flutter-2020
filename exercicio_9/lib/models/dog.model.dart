part 'dog.model.g.dart';

class Dog {
  final String image;

  Dog({
    this.image
  });

  factory Dog.fromJson(Map<String, dynamic> json) =>
      _$DogFromJson(json);
}