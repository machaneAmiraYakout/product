
import 'dart:ui';

import 'package:stacked/stacked.dart';

import '../models/vegetableslistmodel.dart';

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
   List<ListProductModel> searchProduct = [];
   void search(String value) {

     searchProduct = _products.where((product) {
       return product.name.toLowerCase().contains(value.toLowerCase());
     }).toList();
     print("list search ${searchProduct.toString()}");
     notifyListeners();
   }


}
