import 'package:flutter/material.dart';

import '../models/vegetableslistmodel.dart';

Widget BuildSearchItem( prodSearch, context){
  return Padding(
    padding:EdgeInsets.all(20.0) ,
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child:   Text(
              prodSearch.name,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              )


          ),)
      ],
    ),
  );
}
