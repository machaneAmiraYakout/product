
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../models/productdetailmodel.dart';
import '../models/productlistmodel.dart';
import '../viewmodel/productdetailviewmodel.dart';
class ProductDetailScreen extends StatelessWidget {

  String Name;
  String Price;
  String Image1;
  ProductDetailScreen({required this.Name,required this.Price,required this.Image1});




  @override
  Widget build(BuildContext context) {
    return     ViewModelBuilder<ProductDetailViewModel>.reactive(
      viewModelBuilder: () => ProductDetailViewModel(),
      onModelReady: (model) => model.fetchProductsDetail(),
      builder: (context, model, child) {




        return  Scaffold(
            backgroundColor: Colors.white,// Get the product detail from the ViewModel

             body: SingleChildScrollView(
                 child: SafeArea(
                   child:Padding(
                      padding: EdgeInsets.only(top: 30,bottom: 20),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                      Padding(padding: EdgeInsets.only(left:15),
                         child: InkWell(
                            onTap: (){
                            Navigator.pop(context);
                          },
                           child: const Icon(Icons.arrow_back_ios,
                           size: 40,
                           color: Color(0xfff0c557)
                        ),
                            ),),
                                SizedBox(height: 20,),
                              Center(
                              child: Image.asset(Image1,
                          width: MediaQuery.of(context).size.width/1.2,),
                ),
                          SizedBox(height: 20.0,),
                          Padding(
                                padding: EdgeInsets.only(left:25 ,right:40,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [


                                  Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                   Text(Name,style: const TextStyle(
                                   fontSize: 30.0,
                                   fontWeight: FontWeight.w600,
                                   color:  Color(0xff558949),
                                   letterSpacing: 2,
                                   ),),
                                    const Text("Organic Natural ",style: TextStyle(
                                   fontSize: 25.0,
                                   fontWeight: FontWeight.w300,
                                   color:  Color(0xff0d2a00),
                                   ),),
                                      const SizedBox(height: 10.0,),
                            //name

                          ],
                         ),
                                           Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children:  [
                                               Text(Price,style: const TextStyle(
                                               fontSize: 15.0,
                                               fontWeight: FontWeight.w600,
                                               color: Color(0xff0d2a00),

                             ),),
                             const SizedBox(height: 10.0,),
                             const Text("Each kg",style: TextStyle(
                               fontSize: 15.0,
                               fontWeight: FontWeight.w300,
                               color: Color(0xff558949),
                             ),),
                           ],
                         ),

                       ],
                     ),
                              const SizedBox(height: 10.0,),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal:5 ,vertical: 10),
                        margin: const EdgeInsets.symmetric(horizontal:0 ,vertical: 13),
                        width: 440,
                        height: 200,
                        decoration:
                        BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:  Color(0xff558949).withOpacity(0.3),
                        ),
                                  child:
                                 Center(child:
                                 Text(model.productsDetail[0].description ,style: const TextStyle(
                                   fontSize: 25.0,
                                   fontWeight: FontWeight.w700,
                                   color: Color(0xff2f5313),
                                 ),),)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ) ,
        ),
    )
    );
      }
    );

  }
}




