import 'package:cloud_firestore/cloud_firestore.dart';

class Animal {

  final FirebaseFirestore db = FirebaseFirestore.instance;

  String idDono = "";
  String nomePet = "";
  String sexoPet = "";
  String especiePet = "";
  String portePet = "";

  String cidade= "";
  String bairro= "";
  String rua   = "";

  List<String> imagensPet = [];

  bool vacinadoPet = false;
  bool castradoPet = false;
  bool chipadoPet = false;
  bool vermifugadoPet = false;

  Animal({
    this.idDono       = "",
    this.nomePet      = "",
    this.sexoPet      = "",
    this.portePet     = "",
    this.especiePet   = "",
    this.cidade       = "",
    this.bairro       = "",
    this.rua          = "",
    this.imagensPet   = const [],
    this.vacinadoPet    = false,
    this.castradoPet    = false,
    this.chipadoPet     = false,
    this.vermifugadoPet = false,
  }){
      this.imagensPet = [];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idDono"         : this.idDono,
      "nomePet"        : this.nomePet,
      "portePet"       : this.portePet,
      "sexoPet"        : this.sexoPet,
      "cidade"         : this.cidade,
      "bairro"         : this.bairro,
      "rua"            : this.rua,
      "especiePet"     : this.especiePet,
      "imagensPet"     : this.imagensPet,
      "vacinadoPet"    : this.vacinadoPet,
      "castradoPet"    : this.castradoPet,
      "chipadoPet"     : this.chipadoPet,
      "vermifugadoPet" : this.vermifugadoPet,
    };
    return map;
  }


  factory Animal.fromMap(Map<dynamic, dynamic> dados){
    return Animal(
      idDono:  dados['idDono']     ?? '',
      nomePet: dados['nomePet']    ?? '',
      sexoPet: dados['sexoPet']    ?? '',

      portePet:    dados['portePet']      ?? '',
      especiePet:  dados['especiePet']    ?? '',
      imagensPet:  dados['imagensPet']    ?? [], //as List<String>
      vacinadoPet: dados['vacinadoPet']   ?? false,
      castradoPet: dados['castradoPet']   ?? false,
      chipadoPet:  dados['chipadoPet']    ?? false,

      vermifugadoPet: dados['vermifugado']   ?? false,
    );
  }
}
