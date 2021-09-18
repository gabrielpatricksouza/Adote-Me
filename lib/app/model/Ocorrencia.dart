
class Denuncia {

  String idDenuncia = "";
  String idDenunciante = "";
  String nomeSuspeito = "";
  String tipoDenuncia = "";

  String cidade= "";
  String bairro= "";
  String rua   = "";

  List? imagensDenuncia;


  Denuncia({
    this.idDenuncia        = "",
    this.idDenunciante       = "",
    this.nomeSuspeito      = "",
    this.tipoDenuncia     = "",
    this.cidade       = "",
    this.bairro       = "",
    this.rua          = "",
    this.imagensDenuncia,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idDenuncia"       : this.idDenuncia,
      "idDenunciante"    : this.idDenunciante,
      "nomeSuspeito"     : this.nomeSuspeito,
      "tipoDenuncia"     : this.tipoDenuncia,
      "cidade"           : this.cidade,
      "bairro"           : this.bairro,
      "rua"              : this.rua,
      "imagensDenuncia"  : this.imagensDenuncia,
    };
    return map;
  }


  factory Denuncia.fromMap(Map<dynamic, dynamic> dados){
    return Denuncia(
      idDenuncia:   dados['idDenuncia']    ?? '',
      idDenunciante:dados['idDenunciante'] ?? '',
      nomeSuspeito: dados['nomeSuspeito']  ?? '',

      tipoDenuncia: dados['tipoDenuncia']   ?? '',
      cidade:       dados['cidade']         ?? '',
      bairro:       dados['bairro']         ?? '',
      rua:          dados['rua']            ?? '',

      imagensDenuncia:  dados['imagensDenuncia']    ?? [],
    );
  }
}
