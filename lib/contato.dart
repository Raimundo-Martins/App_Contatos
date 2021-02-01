import 'package:app_contatos_cajazeiras/telefone.dart';

class Contato{
  String categoria;
  List<Telefone> telefones;

  Contato({this.categoria, this.telefones});

  Contato.fromJson(Map<dynamic, dynamic> json){
    categoria = json['categoria'];
    var lista = json['telefones'] as List;

    List<Telefone> listaTelefone = lista.map((i) => Telefone.fromJson(i)).toList();
    telefones = listaTelefone;
  }

  Map<dynamic, dynamic> toJson(){
    Map<dynamic, dynamic> json = Map<dynamic, dynamic>();
    json['categoria'] = this.categoria;
    json['telefones'] = this.telefones;
    return json;
  }
}