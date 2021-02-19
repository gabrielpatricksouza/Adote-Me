import 'package:email_validator/email_validator.dart';

class ValidarCadastro{

  String primeiroNome;
  String senha1;
  String senha2;
  String email;

  ValidarCadastro(
      this.primeiroNome, this.senha1, this.senha2, this.email);

  validandoCampos(){

    if  (
    //Se nenhum campo estiver vazio
        this.primeiroNome.isNotEmpty &&
        this.senha1.isNotEmpty       &&
        this.senha2.isNotEmpty       &&
        this.email.isNotEmpty
    ){

      if(
      //Se todos os campo forem maior que 3 caracteres
          this.primeiroNome.length > 3 &&
          this.senha1.length       > 3 &&
          this.senha2.length       > 3 &&
          this.email.length        > 3

      ){
        //Validando e-mail (retorna bool)
        if(EmailValidator.validate(this.email)){
          if(this.senha1 == this.senha2){
            return "Valido";

          }else{
            return "Senhas  diferentes!";
          }

        }else{
          return "E-mail inserido não é valido!";
        }

      }else{
        return "Todos os campos precisam ter mais que 3 caracteres";
      }

    }else{
      return "Os campos precisam ser preenchidos";
    }

  }

//******************************************************************************

}