import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String idUsuario = "";
  String nome = "";
  String email = "";
  String senha = "";

  String urlImage = "";

  bool admin = false;

  Usuario(
      {this.idUsuario = "",
      this.nome = "",
      this.email = "",
      this.senha = "",
      this.urlImage = "",
      this.admin = false});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": this.idUsuario,
      "nome": this.nome,
      "email": this.email,
      "urlImage": this.urlImage
    };
    return map;
  }

  factory Usuario.fromMap(Map<dynamic, dynamic> dados) {
    return Usuario(
      idUsuario: dados['id']       ?? '',
      nome:      dados['nome']     ?? '',
      email:     dados['email']    ?? '',
      urlImage:  dados['urlImage'] ?? '',
    );
  }

  factory Usuario.clean() {
    return Usuario(
      idUsuario: '',
      nome:      '',
      email:     '',
      urlImage:  '',
    );
  }
}
