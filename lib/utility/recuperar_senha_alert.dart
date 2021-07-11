
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'simple_alert.dart';

recuperarSenha(context) {
  TextEditingController _controllerEmailRecuperaSenha = TextEditingController();

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

                // controllerLogin.userStore.recuperandoSenha(emailRecupera);
                Navigator.pop(context);

                simpleCustomAlert(
                    context,
                    AlertType.info,
                    "ATENÇÃO",
                    "Acesse seu e-mail para redefinir senha!"
                );

              } else {

                simpleCustomAlert(
                    context,
                    AlertType.info,
                    "ATENÇÃO",
                    "Insira um e-mail válido podermos redefinir sua senha"
                );
              }
            } else {

              simpleCustomAlert(
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

          color:  Color(0xff1F1F30),
        )
      ]).show();
}