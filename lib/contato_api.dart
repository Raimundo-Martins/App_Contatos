import 'dart:convert';
import 'package:app_contatos_cajazeiras/Contato.dart';
import 'package:flutter/services.dart';

class ContatoApi{
  static Future<List<Contato>> getContatos() async {
    String dados = await rootBundle.loadString("assets/jsons/telefoneCZ.json");

    List lista = json.decode(dados);
    List<Contato> listaContatos = List<Contato>();

    for (Map map in lista) {
      Contato contato = Contato.fromJson(map);
      listaContatos.add(contato);
    }
    return listaContatos;
  }
}