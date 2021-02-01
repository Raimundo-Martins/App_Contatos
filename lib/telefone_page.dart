import 'package:app_contatos_cajazeiras/Contato.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ContatoPage extends StatefulWidget {
  Contato contato;
  ContatoPage(this.contato);

  @override
  _ContatoPageState createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.contato.categoria,
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[300],
      ),
      body: _body(),
    );
  }

  _body() {
    return ListView.builder(
        itemCount: widget.contato.telefones.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  onTap: () {},
                  title: Text(
                    widget.contato.telefones[index].nome,
                    style: TextStyle(fontSize: 25),
                  ),
                  subtitle: Text(
                     widget.contato.telefones[index].numero,
                    style: TextStyle(fontSize: 25),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.phone),
                        color: Colors.green,
                        iconSize: 30.0,
                        onPressed: () {
                          _abrirNumero( widget.contato.telefones[index].numero);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {
                          Share.share( widget.contato.telefones[index].numero);
                        },
                        color: Colors.redAccent,
                        iconSize: 30.0,
                      ),
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
          );
        });
  }

  _abrirNumero(String numero) async {
    String url = "tel:$numero";
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
