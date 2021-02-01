import 'package:app_contatos_cajazeiras/principal.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    _proximaPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/imagens/logo-TelefonesCZ.PNG",
            width: 300,
            height: 300,
          ),
          CircularProgressIndicator(),
          Text("Seja bem vindo!", style: TextStyle(fontSize: 25),)
          ],
        ),
      ),
    );
  }

  _proximaPage() async{
    await Future.delayed(Duration(seconds: 5));

    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (BuildContext context){
        return TelaPrincipal();
      }
    ));
  }
}