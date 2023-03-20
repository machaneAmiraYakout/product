import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:product_app/models/vegetableslistmodel.dart';
import 'package:stacked/stacked.dart';
import '../components/components.dart';
import '../viewmodel/vegetableslistviewmodel.dart';
class Search extends StatelessWidget {
  TextEditingController Controller= TextEditingController();
   final List<ListProductModel> modelProducts;
   Search(this.modelProducts);
  @override
  Widget build(BuildContext context) {
    return   ViewModelBuilder<ProductListViewModel>.reactive(
        viewModelBuilder: () => ProductListViewModel(),
        onModelReady: (model) => model.fetchProducts(),
        builder: (context, model, child) {
        return  Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xff558949)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Find Your Product',
                      hintStyle: TextStyle(
                        color: Colors.white60,
                      ),
                      prefixIcon: Icon(Icons.search,
                        color: Color(0xff0d2a00),),
                    ),
                    controller: Controller,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      model.search(value);
                      print('value on changed ${value}');
                    },
                  ),),
                ConditionalBuilder(
                   condition:model.searchProduct.length>0,
                   builder: (context)=>Expanded(child: ListView.separated(

                       physics: BouncingScrollPhysics(),
                       itemBuilder: (context, index){
                         final product = model.searchProduct[index];
                         return BuildSearchItem(product,context);},
                       separatorBuilder: (context, index)=>Container(
                         width: double.infinity,
                         height: 1.0,
                         color: Colors.grey,
                       ),
                       itemCount: model.searchProduct.length)),
                    fallback: (context)=>Center(child: CircularProgressIndicator(),)
                ),
              ],
            ),
          );
  });
  }
}
