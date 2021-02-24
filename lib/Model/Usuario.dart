import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {

  String _idUsuario;
  String _nome;
  String _email;
  String _senha;

  String _urlImage;

  bool admin   = false;

  Usuario(){
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference users = db.collection("usuarios");
    this.idUsuario = users.doc().id;
  }


  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {
      "id"           : this.idUsuario,
      "nome"         : this.nome,
      "email"        : this.email,
      "urlImage"     : this.urlImage
    };
    return map;
  }


  String get urlImage => _urlImage;

  set urlImage(String value) {
    _urlImage = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }


  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get idUsuario => _idUsuario;

  set idUsuario(String value) {
    _idUsuario = value;
  }

}