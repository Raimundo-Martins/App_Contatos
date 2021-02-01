import 'package:flutter/material.dart';

class Apoiadores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Apoiadores",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50.0, bottom: 2.0, left: 23.0),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/imagens/logo_fafic.png',
            ),
            Image.asset(
              'assets/imagens/logo_ciencia_computacao.jpg',
            ),
            Padding(
              padding: EdgeInsets.only(top: 13.0),
              child: Image.asset(
                'assets/imagens/logo_oab.jpeg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}