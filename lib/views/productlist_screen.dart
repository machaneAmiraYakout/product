import 'package:flutter/material.dart';
import 'package:product_app/views/ProductDetailScreen.dart';
import 'package:product_app/views/Favorite.dart';
import 'package:badges/badges.dart';
import 'package:stacked/stacked.dart';
import '../viewmodel/favorite_viewmodel.dart';
import '../viewmodel/parent_viewmodel.dart';
import 'fruitlist_screen.dart';
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}
class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return   ViewModelBuilder<ParentViewModel>.reactive(
        viewModelBuilder: () => ParentViewModel(),
    onModelReady: (model) => model.childViewModel1.fetchProducts(),
    builder: (context, model, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart_outlined, color: Color(0xff1c4900),),
              const SizedBox(width: 5,),
              const Text("MaGiC HoUsE", style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff558949),
              ),),
              const SizedBox(width: 170,),
              Badge(
                badgeContent:  Text('${model.childViewModel2.favorites.length}'),
                child: IconButton(
                  onPressed: () {
                  List.generate(model.childViewModel1.products.length, (index) {
                  final favList = model.childViewModel1.products[index];

                  });
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorite()));
                  },
                  icon: const Icon(Icons.favorite_sharp,
                    color: Color(0xff558949),
                    size: 33,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 20),
                  width: 400,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xff558949).withOpacity(0.7),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("WhaT Do You ",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),),
                      const Text("LikE to OrdeR ?",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),),
                      const SizedBox(height: 15,),
                      //search
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white70),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Find Your Product',
                            hintStyle: TextStyle(
                              color: Color(0xff819f7b),
                            ),
                            prefixIcon: Icon(Icons.search,
                              color: Color(0xff0d2a00),),
                          ),
                          onTap: (){},
                        ),
                      ),
                    ],
                  ),
                ),
                //  SizedBox(height: 10,),
                DefaultTabController(
                    length: 2, // length of tabs
                    initialIndex: 0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const TabBar(
                            labelColor: Color(0xff1c4700),
                            unselectedLabelColor: Color(0xff558949),
                            tabs: [
                              Tab(text: 'Vegetables'),
                              Tab(text: 'Fruits'),

                            ],
                          ),
                          Container(
                              height: 400, //height of TabBarView
                              decoration: const BoxDecoration(
                                  border: Border(top: BorderSide(
                                      color: Colors.grey, width: 0.5))
                              ),
                              child: TabBarView(children: <Widget>[
                                //vegetablesList
                                GridView.count(
                              crossAxisCount: 2,
                                shrinkWrap: true,
                                childAspectRatio: (150 / 190),
                                children: List.generate(model.childViewModel1.products.length, (index) {
                                  final productd = model.childViewModel1.products[index];
                                  return Card(
                                  child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context)=>
                                                    ProductDetailScreen(
                                                        Name:productd.name ,
                                                        Price:productd.price,
                                                        Image1:productd.image,
                                                     )));
                                          },
                                          child: Image.asset(productd.image,
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
                                                  Text(productd.name,
                                                    style: const TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      color: Color(0xff0d2a00)
                                                  ),),
                                                  SizedBox(height: 5,),
                                                  const Text(
                                                    "Fresh Organic",
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      color: Color(0xff558949),
                                                    ),),

                                                ],
                                              )
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets
                                              .symmetric(vertical: 5),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text('${productd.price}',
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight
                                                      .w600,
                                                  color: Color(0xff0d2a00)
                                              ),),

                                             ViewModelBuilder<FavoriteViewModel>.reactive(
                                                 disposeViewModel: false,
                                             viewModelBuilder: () {return FavoriteViewModel(); },
                                                 builder: (context, model, child) {
                                                 return GestureDetector(
                                                onTap: () {
                                                  model.toggleFavorite(productd);
                                                  print(model.isFavorite(productd));

                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color:  Colors.white,
                                                      borderRadius: BorderRadius
                                                          .circular(50)
                                                  ),
                                                  child: Icon(
                                                      model.isFavorite(productd) ?
                                                      Icons.favorite : Icons.favorite_border,
                                                      color:  Color(0xff2f5313),
                                                    ),
                                              ),
                                              );
                                             }
                                             ),
                                  ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                                //FruitsList
                                FruitListScreen(),
                              ])
                          )
                        ])
                ),
              ],
            ),
          ),
        ),

      );
    }
    );

  }
}
