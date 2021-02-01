import 'package:app_contatos_cajazeiras/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(
    App(),
  );
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CajazeirasCZ",
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}