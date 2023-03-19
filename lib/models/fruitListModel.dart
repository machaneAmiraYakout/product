
import 'dart:ui';

class FruitListModel {
  String _namef;
  String get namef => _namef;

  String _pricef;
  String get pricef => _pricef;

  String _imagef;
  String get imagef => _imagef;

  FruitListModel({
    required String namef,
    required String pricef,
    required String imagef,
  })  : _namef = namef,
        _pricef = pricef,
        _imagef = imagef;
}
