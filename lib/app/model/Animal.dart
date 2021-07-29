import 'package:cloud_firestore/cloud_firestore.dart';

class Animal {

  final FirebaseFirestore db = FirebaseFirestore.instance;

  String idPet = "";
  String idDono = "";
  String nomePet = "";
  String sexoPet = "";
  String especiePet = "";
  String portePet = "";
  String whatsapp = "";

  String cidade= "";
  String bairro= "";
  String rua   = "";

  List? imagensPet;

  bool vacinadoPet = false;
  bool castradoPet = false;
  bool chipadoPet = false;
  bool vermifugadoPet = false;

  Animal({
    this.idPet        = "",
    this.idDono       = "",
    this.nomePet      = "",
    this.sexoPet      = "",
    this.portePet     = "",
    this.whatsapp     = "",
    this.especiePet   = "",
    this.cidade       = "",
    this.bairro       = "",
    this.rua          = "",
    this.imagensPet,
    this.vacinadoPet    = false,
    this.castradoPet    = false,
    this.chipadoPet     = false,
    this.vermifugadoPet = false,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idPet"          : this.idPet,
      "idDono"         : this.idDono,
      "nomePet"        : this.nomePet,
      "portePet"       : this.portePet,
      "whatsapp"       : this.whatsapp,
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
      idPet:   dados['idPet']      ?? '',
      idDono:  dados['idDono']     ?? '',
      nomePet: dados['nomePet']    ?? '',
      sexoPet: dados['sexoPet']    ?? '',
      whatsapp:dados['whatsapp']    ?? '',

      portePet:    dados['portePet']      ?? '',
      especiePet:  dados['especiePet']    ?? '',
      cidade:      dados['cidade']        ?? '',
      bairro:      dados['bairro']        ?? '',
      rua:         dados['rua']           ?? '',
      imagensPet:  dados['imagensPet']    ?? [], //as List<String>
      vacinadoPet: dados['vacinadoPet']   ?? false,
      castradoPet: dados['castradoPet']   ?? false,
      chipadoPet:  dados['chipadoPet']    ?? false,

      vermifugadoPet: dados['vermifugado']   ?? false,
    );
  }
}
