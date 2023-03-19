import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../models/productlistmodel.dart';
import '../viewmodel/favorite_viewmodel.dart';

class Favorite extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavoriteViewModel>.reactive(
      viewModelBuilder: () => FavoriteViewModel(),
      disposeViewModel: false,
      builder: (context, model, child) {


      return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        body: ListView.separated(
          itemBuilder: (context, index){

            final product = model.favorites[index];
            return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40.0,

                  child: Image.asset(product.image),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),),
                        Text(product.price,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),),
                      ],
                    )),
                const SizedBox(
                  width: 20.0,
                ),
                IconButton(
                  onPressed: () {

                  },
                  color: Colors.red,
                  icon: Icon(Icons.favorite_sharp),),
                IconButton(
                  onPressed: () {

                  },
                  color: Colors.grey,
                  icon: Icon(Icons.details),),

              ],
            ),
          );},

          separatorBuilder: (context, index) =>
              Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey,
              ),
          itemCount: model.favorites.length,),
      );


      },
    );
    }

  }


