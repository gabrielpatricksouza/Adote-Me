import 'package:adote_me/View/Home/configuration.dart';
import 'package:flutter/material.dart';


customShowDialog(context, String text,String route,Function function){

  return  Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //this right here
    child: Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.4,

      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text("$text", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.black,
          ),

          FlatButton(
              onPressed: (){
                function();
                Navigator.pushNamedAndRemoveUntil(context, "$route", (route) => false);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Text("Sair", style: TextStyle(fontSize: 17, color: primaryGreen,),)
          ),

          Divider(
            height: 1,
            color: Colors.black,
          ),

          FlatButton(
              onPressed: (){
                Navigator.pop(context);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Text("Cancelar", style: TextStyle(fontSize: 16, color: Colors.grey[600],),)
          ),
        ],
      ),
    ),
  );
}
