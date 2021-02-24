import 'package:adote_me/View/Login/login.dart';
import 'package:adote_me/View/Login/loginSingIn.dart';
import 'package:adote_me/View/Login/loginSingUp.dart';
import 'package:adote_me/View/Perfil/minhaConta.dart';
import 'package:adote_me/View/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {

  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings){

    final args = settings.arguments;//recebe os argumentos(parametros) passados

    switch(settings.name){

      case "/":
        return MaterialPageRoute(builder: (_)=> HomePage());

      case "/home":
        return MaterialPageRoute(builder: (_)=> HomePage());

      case "/login":
        return MaterialPageRoute(builder: (_)=> Login());

      case "/singIn":
        return MaterialPageRoute(builder: (_)=> SingIn());

      case "/singUp":
        return MaterialPageRoute(builder: (_)=> SingUp());

      case "/minhaConta":
        return MaterialPageRoute(builder: (_)=>MinhaConta(args));



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
