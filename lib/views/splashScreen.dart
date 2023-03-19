import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Image.asset('assets/shopy.png',height: 500),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Text("Safe FOOD Delivery",style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.orange

            ),),

          ),
          SizedBox(
            height: 60.0,),
          GestureDetector(
            onTap: (){
              //i used this so the user cant go back to the start screen
              Navigator.pushReplacementNamed(context, "ProductListScreen");
            },
            child: Container(
              height: 50,
              width: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Color(0xff7ac777),
              ),
              child: const Center(
                child:Text("GeT StarteD",style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),),
              )
            ),
          )
        ],
      ) ,
    );
  }
}
