import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Rotas/RouteGenerator.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'), // portugues

      ],
      debugShowCheckedModeBanner: false,
      home: splachScreen(),
      theme: ThemeData(
        fontFamily: 'Circular',
        primaryColor: Color(0xff201e1f),//2EC1E8
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
// ignore: camel_case_types
class splachScreen extends StatefulWidget {
  @override
  _splachScreenState createState() => _splachScreenState();
}

// ignore: camel_case_types
class _splachScreenState extends State<splachScreen> {

//Bloquear Rotação de tela
  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }


  @override
  void initState() {
    Firebase.initializeApp();

    super.initState();
    _portraitModeOnly();
    Timer(Duration(seconds: 2), () =>
        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff201e1f),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/logo.png",
            height: 120,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

