import 'package:app_contatos_cajazeiras/lerArquivo.dart';
import 'package:flutter/material.dart';

class SobreCajazeiras extends StatefulWidget {
  @override
  _SobreCajazeirasState createState() => _SobreCajazeirasState();
}

class _SobreCajazeirasState extends State<SobreCajazeiras> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "Sobre Cajazeiras",
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.cloud,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.pie_chart,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[getClima(), getEconomia(), getHistoria()],
        ),
      ),
    );
  }
}

Future<String> clima = LerArquivos.lerTexto('assets/clima.txt');
Future<String> economia = LerArquivos.lerTexto('assets/economia.txt');
Future<String> historia = LerArquivos.lerTexto('assets/historia.txt');

Widget getClima() {
  return SingleChildScrollView(
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Clima",
          style: TextStyle(
            color: Colors.purple,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: FutureBuilder(
              future: clima,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                    ),
                  );
                }
                return Text(
                  snapshot.data,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.justify,
                );
              }),
        ),
      ],
    ),
  );
}

Widget getEconomia() {
  return SingleChildScrollView(
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Economia",
          style: TextStyle(
            color: Colors.purple,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: FutureBuilder(
              future: economia,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                    ),
                  );
                }
                return Text(
                  snapshot.data,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.justify,
                );
              }),
        ),
      ],
    ),
  );
}

Widget getHistoria() {
  return SingleChildScrollView(
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "História",
          style: TextStyle(
            color: Colors.purple,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: FutureBuilder(
              future: historia,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                    ),
                  );
                }
                return Text(
                  snapshot.data,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.justify,
                );
              }),
        ),
      ],
    ),
  );
}
