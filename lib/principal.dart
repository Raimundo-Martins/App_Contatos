import 'dart:io';

import 'package:app_contatos_cajazeiras/Contato.dart';
import 'package:app_contatos_cajazeiras/Contato_api.dart';
import 'package:app_contatos_cajazeiras/ajudeNos.dart';
import 'package:app_contatos_cajazeiras/apoiadores.dart';
import 'package:app_contatos_cajazeiras/sobre_cajazeiras.dart';
import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';

import 'telefone_page.dart';

class TelaPrincipal extends StatelessWidget {
  BuildContext get context => null;

  @override
  Widget build(BuildContext context) {
    var listaBotoes = List<UnicornButton>();
    listaBotoes.add(UnicornButton(
      labelColor: Colors.orange,
      labelFontSize: 25,
      hasLabel: true,
      labelText: "Sair",
      currentButton: FloatingActionButton(
        backgroundColor: Colors.white,
        heroTag: "Sair",
        mini: true,
        child: Icon(
          Icons.exit_to_app,
          color: Colors.orange,
          size: 30,
        ),
        onPressed: () {
          exit(0);
        },
      ),
    ));
    listaBotoes.add(UnicornButton(
      labelColor: Colors.purple[300],
      labelFontSize: 25,
      labelBackgroundColor: Colors.white,
      hasLabel: true,
      labelText: "Apoiadores",
      currentButton: FloatingActionButton(
        backgroundColor: Colors.white,
        heroTag: "Apoiadores",
        mini: true,
        child: Icon(
          Icons.phonelink_setup,
          color: Colors.purple[300],
          size: 30,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Apoiadores();
          }));
        },
      ),
    ));
    listaBotoes.add(UnicornButton(
      labelColor: Colors.purple[300],
      labelFontSize: 25,
      hasLabel: true,
      labelText: "Ajude-nos",
      currentButton: FloatingActionButton(
        backgroundColor: Colors.white,
        heroTag: "Ajude",
        mini: true,
        child: Icon(
          Icons.question_answer,
          color: Colors.purple[300],
          size: 30,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AjudeNos();
          }));
        },
      ),
    ));
    listaBotoes.add(UnicornButton(
      labelColor: Colors.purple[300],
      labelFontSize: 25,
      hasLabel: true,
      labelText: "Sobre Cajazeiras",
      currentButton: FloatingActionButton(
        heroTag: "sobre",
        backgroundColor: Colors.white,
        mini: true,
        child: Icon(
          Icons.info_outline,
          color: Colors.purple[300],
          size: 30,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SobreCajazeiras();
          }));
        },
      ),
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.phone_in_talk,
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'TelefoneCZ',
                  style: TextStyle(fontSize: 30),
                ))
          ],
        ),
      ),
      body: _body(),
      floatingActionButton: UnicornDialer(
        backgroundColor: Colors.black54,
        orientation: UnicornOrientation.VERTICAL,
        parentButton: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        parentButtonBackground: Colors.purple[300],
        childButtons: listaBotoes,
      ),
    );
  }

  _body() {
    return FutureBuilder(
      future: ContatoApi.getContatos(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        List<Contato> listaContatos = snapshot.data;
        return _listView(listaContatos);
      },
    );
  }

  _listView(List<Contato> listaContatos) {
    return ListView.builder(
      itemCount: listaContatos.length,
      itemBuilder: (context, index) {
        return _itemList(context, listaContatos[index]);
      },
    );
  }

  _itemList(BuildContext context, Contato contato) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return ContatoPage(contato);
          }));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                trailing: Icon(
                  Icons.chevron_right,
                  size: 35,
                ),
                title: Text(
                  contato.categoria,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Divider(),
          ],
        ));
  }
}
