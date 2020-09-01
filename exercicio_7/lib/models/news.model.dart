import 'package:flutter/cupertino.dart';

class News {
  final String title, description, category, url, image, author;

  const News({
    @required this.title,
    @required this.description,
    @required this.category,
    @required this.url,
    @required this.image,
    @required this.author,
  })  : assert(title != null),
        assert(description != null),
        assert(category != null),
        assert(url != null),
        assert(image != null),
        assert(author != null);
}
