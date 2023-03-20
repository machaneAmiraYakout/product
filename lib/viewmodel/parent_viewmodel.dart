import 'package:flutter/material.dart';
import 'package:product_app/viewmodel/vegetableslistviewmodel.dart';
import 'package:stacked/stacked.dart';

import 'favorite_viewmodel.dart';

class ParentViewModel extends BaseViewModel implements ChangeNotifier {
  final childViewModel1 = ProductListViewModel();
  final childViewModel2 = FavoriteViewModel();


}
