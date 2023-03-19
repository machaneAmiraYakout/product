
import 'dart:ui';

import 'package:stacked/stacked.dart';

import '../models/productlistmodel.dart';

class ProductListViewModel extends BaseViewModel {

   List<ListProductModel> _products = [];
  List<ListProductModel> get products => _products;


  Future<void> fetchProducts() async {
    _products = [
      ListProductModel(name: 'Brokoli', price: '\$10.0', image: 'assets/b.png'),
      ListProductModel(name: 'Carottes ', price: '\$20.0', image: 'assets/c.png'),
      ListProductModel(name: 'Zucchini', price: '\$30.0', image: 'assets/j.png'),
    ];

    // Notify listeners that the data has changed
    notifyListeners();
  }


}
