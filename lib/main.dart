import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:product_app/views/productlist_screen.dart';
import 'package:product_app/views/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          titleSpacing: 20.0,
          backgroundColor: Colors.white,

          elevation: 0.0,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),

        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0.0,

        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              color: Colors.black
          ),
        ),

      ),
     routes: {
       "/":(context)=>StartScreen(),
       "ProductListScreen":(context)=>ProductListScreen(),
     },
      debugShowCheckedModeBanner: false,
    );
  }
}
