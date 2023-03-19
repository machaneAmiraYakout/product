
import 'dart:ui';

import 'package:product_app/models/fruitListModel.dart';
import 'package:stacked/stacked.dart';



class FruitListViewModel extends BaseViewModel {

  List<FruitListModel> _productsF = [];
  List<FruitListModel> get productsF => _productsF;


  Future<void> fetchFruits() async {
    _productsF = [
      FruitListModel(namef: 'Avocado', pricef: '\$25.0', imagef: 'assets/av.png'),
      FruitListModel(namef: 'Banana ', pricef: '\$20.0', imagef: 'assets/bn.png'),
      FruitListModel(namef: 'Peach', pricef: '\$10.0', imagef: 'assets/ph.png'),
    ];

    // Notify listeners that the data has changed
    notifyListeners();
  }


}
