import 'package:adote_me/Controller/C_Perfil/controller_perfil.dart';
import 'package:adote_me/View/Alerts/SimpleAlert.dart';
import 'package:adote_me/View/Home/configuration.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

confirmacao(context){
  final _controllerPerfil = ControllerPerfil();
  Alert(
      context: context,
      type: AlertType.warning,
      title: "ATENÇÃO",
      desc: "Deseja deletar sua conta?",
      buttons: [
        DialogButton(
          child: Text(
            "Sim",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async {
            bool resultado;

            Navigator.pop(context);
            resultado = await _controllerPerfil.userStore.deletandoConta();

            print(resultado);

            if(resultado){
              Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
            }
            else{
              simpleCustomAlert(
                  context,
                  AlertType.info, "ATENCÃO",
                  "Não foi possível deletar conta! Tente novamente ou entre em contato conosco."
              );
              Navigator.pop(context);
            }

          } ,
          color:  primaryGreen,
        ),
        DialogButton(
          child: Text(
            "Não",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color:  primaryGreen,
        )
      ],
    ).show();
}