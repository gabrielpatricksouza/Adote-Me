import 'package:adote_me/BO/BO_Cadastro.dart';
import 'package:adote_me/BancoDados/BancoDados.dart';
import 'package:adote_me/Model/Usuario.dart';
import 'package:adote_me/View/Alert/SimpleAlert.dart';
import 'package:mobx/mobx.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store{
  ConexaoBD _acessoBD = ConexaoBD();

  @observable
  String nome = "";

  @action
  void setNome(String text) => nome = text;

  @observable
  String email = "";

  @action
  void setEmail(String text) => email = text;

  @observable
  String senha1 = "";

  @action
  void setsenha1(String text) => senha1 = text;

  @observable
  String senha2 = "";

  @action
  void setsenha2(String text) => senha2 = text;

  @observable
  bool visualizar = true;

  @action
  void boolVisualizar() => visualizar = !visualizar;

  @observable
  bool visualizar2 = true;

  @action
  void boolVisualizar2() => visualizar2 = !visualizar2;

  @observable
  bool carregando = false;

  @observable
  bool cadastrado = false;

  @action
  Future _cadastrarUsuario(context) async {

    dynamic _resultado;
    carregando = true;
    Usuario usuario = Usuario();

    usuario.nome    =   nome.trim();
    usuario.senha   =   senha1.trim();
    usuario.email   =   email.trim();

    _resultado = await _acessoBD.cadastrarUsuario(usuario);

    if(_resultado != true){
      customAlert(context, AlertType.error, "ATENÇÃO", _resultado);
    }
    else cadastrado = true;

    carregando = false;
  }

  @observable
  bool next = false;


  @action
  void validandoNomeEmail(context){
    String _respostaBO;

    var _validarCadastro = ValidarCadastro(
      nome.trim(),
      senha1.trim(),
      senha2.trim(),
      email.trim()
    );
    _respostaBO = _validarCadastro.validandoNomeEmail();


    if(_respostaBO  != "Valido"){
      customAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          _respostaBO
      );
    }
    else next = true;
  }

  @action
  void validandoSenhas(context){
    String _respostaBO;

    var _validarCadastro = ValidarCadastro(
        nome.trim(),
        senha1.trim(),
        senha2.trim(),
        email.trim()
    );
    _respostaBO = _validarCadastro.validandoSenhas();

    if(_respostaBO  != "Valido"){
      customAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          _respostaBO
      );
    }
    else _cadastrarUsuario(context);
  }
}
