import 'package:adote_me/View/Login/loginSingIn.dart';
import 'package:adote_me/View/Login/loginSingUp.dart';
import 'package:adote_me/View/home.dart';
import 'package:adote_me/View/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {

  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings){

    // final args = settings.arguments;//recebe os argumentos(parametros) passados

    switch(settings.name){

      case "/":
        // return MaterialPageRoute(builder: (_)=> TelaLogin()); // (_) == context

      case "/home":
        return MaterialPageRoute(builder: (_)=> HomePage());

      case "/login":
        return MaterialPageRoute(builder: (_)=> Login());

      case "/singIn":
        return MaterialPageRoute(builder: (_)=> SingIn());

      case "/singUp":
        return MaterialPageRoute(builder: (_)=> SingUp());


      default:
        _erroRota();
    }

  }
  static Route<dynamic> _erroRota(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text("Tela não encontrada!"),
        ),

        body: Center(
          child: Text("Tela não encontrada!"),
        ),
      );
    });
  }

}
