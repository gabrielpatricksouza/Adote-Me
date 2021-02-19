import 'package:adote_me/Controller/C_Login/controller_login.dart';
import 'package:adote_me/Model/Usuario.dart';
import 'package:adote_me/View/Home/configuration.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'SimpleAlert.dart';

recuperarSenha(context) {
  TextEditingController _controllerEmailRecuperaSenha = TextEditingController();
  final controllerLogin = ControllerLogin();

  Alert(
      context: context,
      title: "Esqueceu a senha?",
      content: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            child: Text(
              "Informe seu e-mail cadastrado e enviaremos instruções para você criar sua senha.",
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF2a2d34)
              ),
              textAlign: TextAlign.center,
            ),
          ),
          TextField(
            controller: _controllerEmailRecuperaSenha,
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
                )
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            String emailRecupera =_controllerEmailRecuperaSenha.text.trim();

            if (emailRecupera.isNotEmpty) {
              if (EmailValidator.validate(emailRecupera)) {

                Usuario usuario = Usuario();
                usuario.email = emailRecupera;
                controllerLogin.recuperandoSenha(usuario);
                Navigator.pop(context);

                customAlert(
                    context,
                    AlertType.info,
                    "ATENÇÃO",
                    "Acesse seu e-mail para redefinir senha!"
                );

              } else {

                customAlert(
                    context,
                    AlertType.info,
                    "ATENÇÃO",
                    "Insira um e-mail válido podermos redefinir sua senha"
                );
              }
            } else {

              customAlert(
                  context,
                  AlertType.info,
                  "ATENÇÃO",
                  "Insira um e-mail para podermos redefinir sua senha"
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