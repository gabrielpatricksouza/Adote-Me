import 'package:adote_me/View/Home/configuration.dart';
import 'package:flutter/material.dart';


customShowDialog(context, String text,String route,Function function){

  return AlertDialog(
    content: Text("$text", style: TextStyle(fontSize: 20),),
    actions: <Widget>[
      FlatButton(
          onPressed: (){
            function();
            Navigator.pushNamedAndRemoveUntil(context, "$route", (route) => false);
          },
          child: Text("Sim", style: TextStyle(fontSize: 17, color: primaryGreen,),)
      ),

      FlatButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Não", style: TextStyle(fontSize: 16, color: primaryGreen,),)
      ),
    ],
  );
}
