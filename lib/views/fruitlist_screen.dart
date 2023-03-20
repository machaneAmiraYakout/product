import 'package:flutter/material.dart';
import 'package:product_app/views/FruitsDetailScreen.dart';
import 'package:stacked/stacked.dart';
import '../viewmodel/fruitListviewmodel.dart';
class FruitListScreen extends StatelessWidget {
  const FruitListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FruitListViewModel>.reactive(
        viewModelBuilder: () => FruitListViewModel(),
    onModelReady: (model) => model.fetchFruits(),
    builder: (context, model, child) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: (150 / 190),
      children: List.generate(model.productsF.length, (index) {
        final productF = model.productsF[index];
        return Card(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>
                          FruitDetailScreen(NameF:productF.namef , PriceF:productF.pricef, ImageF:productF.imagef,)));},
                child: Image.asset(productF.imagef,
                  width: 130,
                  height: 120,
                  fit: BoxFit.contain,),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,),
                child: Align(
                    alignment: Alignment
                        .centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start,
                      children: [
                        Text(productF.namef,
                          style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight
                                  .w600,
                              color: Color(0xff0d2a00)
                          ),),
                        SizedBox(height: 5,),
                        const Text("Natural Organic",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff558949),
                          ),),
                      ],
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${productF.pricef}',
                      style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0d2a00)
                      ),),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          size: 20.0,
                          color: Color(0xff2f5313),),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
        }
);
}
}

