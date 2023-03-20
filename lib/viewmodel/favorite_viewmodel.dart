import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../models/vegetableslistmodel.dart';
class FavoriteViewModel extends BaseViewModel implements ChangeNotifier{
  List<ListProductModel> _favorites = [ ];
List<ListProductModel> get favorites => _favorites;
  FavoriteViewModel._internal(){
    init();
  }
  static FavoriteViewModel? _instance;
  // this singleton class // one instance for app
  factory FavoriteViewModel() => _instance ??= FavoriteViewModel._internal();



  init() {
   // favorites = getFavoritesProduct();
    setOnModelReadyCalled(true);

  }

  //singleton

  bool isFavorite(ListProductModel product) {
    print(_favorites);
    return _favorites.contains(product);
  }
  void toggleFavorite(ListProductModel product) {
    bool containsProduct = false;

    for (ListProductModel pr in favorites) {print(pr.name);
    if (product == pr) {

      containsProduct = true;
      break;
    }
  }
    if (containsProduct==true){_favorites.remove(product); }else{_favorites.add(product);}

    product.isFavorite = !product.isFavorite;
    print("all product list favorite ${favorites.length}");
    notifyListeners();
  }
  void getfavoriteintolist(){
    _favorites = [];
  }
}
