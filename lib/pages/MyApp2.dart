import 'package:flutter/material.dart';
import 'Character.dart';
class MyApp2 extends StatelessWidget {
  const MyApp2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'Despicable Me Characters',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        appBarTheme: AppBarTheme(
         elevation: 0,
         color: Colors.white 
        )
      ),
      home: CharacterListingScreen(),
    );
  }
}