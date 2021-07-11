import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'simple_alert.dart';

confirmacao(context){
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
            bool resultado = false;

            Navigator.pop(context);
            // resultado = await _controllerPerfil.userStore.deletandoConta();

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
          color:   Color(0xff1F1F30),
        ),
        DialogButton(
          child: Text(
            "Não",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color:  Color(0xff1F1F30),
        )
      ],
    ).show();
}