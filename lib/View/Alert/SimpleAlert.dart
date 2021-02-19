import 'package:adote_me/View/Home/configuration.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: missing_return
Future<bool> customAlert(
    context,
    AlertType alertType,
    String title,
    String mensagemErro
    ){
  Alert(
    context: context,
    type: alertType,
    title: title,
    desc: mensagemErro,
    buttons: [
      DialogButton(
        child: Text(
          "Ok",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
        color: primaryGreen,
      )
    ],
  ).show();
}