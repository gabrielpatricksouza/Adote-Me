import 'package:adote_me/Controller/C_Perfil/controller_perfil.dart';
import 'package:adote_me/Model/Usuario.dart';
import 'package:adote_me/View/Home/configuration.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'SimpleAlert.dart';

alterarEmail(context){
  TextEditingController _controllerEmailAlteraEmail   = TextEditingController();
  final _controllerPerfil = ControllerPerfil();

  Alert(
      context: context,
      title: "Alterar E-mail",
      content: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            child: Text(
              "Informe seu novo e-mail.",
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF2a2d34)
              ),
              textAlign: TextAlign.center,
            ),
          ),
          TextField(
            controller: _controllerEmailAlteraEmail,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black
            ),
            decoration: InputDecoration(
              icon: Icon(Icons.person, size: 30,),
              // border: InputBorder.none,
              hintText: "E-mail",
              hintStyle: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18
              ),
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            String emailAltera = _controllerEmailAlteraEmail.text;

            if (emailAltera.isNotEmpty) {
              if (EmailValidator.validate(emailAltera)) {
                //Verificando se e-mail é válido
                Usuario usuario = Usuario();
                usuario.email = _controllerEmailAlteraEmail.text;
                _controllerPerfil.userStore.mudandoEmail(usuario);

                _controllerEmailAlteraEmail.text = "";

                simpleCustomAlert(
                    context,
                    AlertType.info,
                    "",
                    "E-mail alterado com sucesso!"
                );
                Navigator.pop(context);

              } else {

                simpleCustomAlert(
                    context,
                    AlertType.info,
                    "",
                    "Por favor, insire um e-mail válido."
                );
              }

            } else {
              simpleCustomAlert(
                  context,
                  AlertType.info,
                  "",
                  "Insira um e-mail para podermos alterar."
              );
            }
          },
          child: Text(
            "ENVIAR",
            style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          color:  primaryGreen,
        )
      ]).show();
}