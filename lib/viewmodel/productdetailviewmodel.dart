import 'package:flutter/material.dart';
import 'package:product_app/models/productdetailmodel.dart';
import 'package:stacked/stacked.dart';

class ProductDetailViewModel extends BaseViewModel {

  List<ListProductDetailModel> _productsDetail = [];
  List<ListProductDetailModel> get productsDetail => _productsDetail;



  Future<void> fetchProductsDetail() async {

    _productsDetail = [
      ListProductDetailModel(
          description:'Organic Brokoli are grown without the use of synthetic pesticides or fertilizers.' ),
      ListProductDetailModel(

          description:'Organic Carottes are grown without the use of synthetic pesticides or fertilizers.' ),
      ListProductDetailModel(

          description:'Organic Zucchini are grown without the use of synthetic pesticides or fertilizers.' ),
    ];



    // Notify listeners that the data has changed
    notifyListeners();
  }
}

