import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

simpleCustomAlert(
    context,
    AlertType alertType,
    String title,
    String mensagemErro
    ){
  Alert(
    context: context,
    type: alertType,
    title: title,
    style: AlertStyle(
      backgroundColor: Colors.white,
      titleStyle: GoogleFonts.openSans(
        color: Colors.black,
        fontWeight: FontWeight.w700
      ),
      descStyle: GoogleFonts.openSans(
        color: Colors.black,
      ),
    ),
    desc: mensagemErro,
    buttons: [
      DialogButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Text(
          "Ok",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
        color:  Color(0xff1F1F30)
      )
    ],
  ).show();
}