class Animal {

  String idPet = "";
  String idDono = "";
  String nomePet = "";
  String sexoPet = "";
  String especiePet = "";

  List<String> imagensPet = [];

  bool vacinadoPet = false;
  bool castradoPet = false;
  bool chipadoPet = false;
  bool vermifugadoPet = false;

  Animal(
      {
      this.idPet        = "",
      this.idDono       = "",
      this.nomePet      = "",
      this.sexoPet      = "",
      this.especiePet   = "",
      this.imagensPet   = const [],
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
      "sexoPet"        : this.sexoPet,
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

      especiePet:  dados['especiePet']    ?? '',
      imagensPet:  dados['imagensPet']    ?? [], //as List<String>
      vacinadoPet: dados['vacinadoPet']   ?? false,
      castradoPet: dados['castradoPet']   ?? false,
      chipadoPet:  dados['chipadoPet']    ?? false,

      vermifugadoPet: dados['vermifugado']   ?? false,
    );
  }
}
