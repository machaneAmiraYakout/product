
import 'package:stacked/stacked.dart';
import '../models/fruitDetailmodel.dart';
class FruitDetailViewModel extends BaseViewModel {
  List<FruitListDetailModel> _fruitsDetail = [];
  List<FruitListDetailModel> get fruitsDetail => _fruitsDetail;
  Future<void> fetchFruitsDetail() async {
    _fruitsDetail = [
      FruitListDetailModel(
          description:'Organic Avocado are grown without the use of synthetic pesticides or fertilizers.' ),
      FruitListDetailModel(

          description:'Organic Banana are grown without the use of synthetic pesticides or fertilizers.' ),
      FruitListDetailModel(

          description:'Organic Peach are grown without the use of synthetic pesticides or fertilizers.' ),
    ];
    // Notify listeners that the data has changed
    notifyListeners();
  }
}

