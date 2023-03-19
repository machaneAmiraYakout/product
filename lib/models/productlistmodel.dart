
import 'dart:ui';

class ListProductModel {
  String _name;
  String get name => _name;

  String _price;
  String get price => _price;

  String _image;
  String get image => _image;
  bool isFavorite;

  ListProductModel({
    required String name,
    required String price,
    required String image,
    this.isFavorite = false,
  })  : _name = name,
        _price = price,
        _image = image;
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ListProductModel &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              price == other.price ;

}
