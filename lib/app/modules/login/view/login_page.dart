import 'package:adote_me/app/modules/login/store/login_store.dart';
import 'package:adote_me/widgets/custom_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/bemVindo.png",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: 20,
            left: 0,
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined),
                iconSize: 30,
                onPressed: () => Navigator.pop(context)
            ),
          ),

          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  CustomAnimatedButton(
                    onTap:  ()=> Modular.to.pushNamed("/login/singIn"),
                    widhtMultiply: 1,
                    height: 60,
                    text: "Entrar",
                    color: Color(0XFF338fa0),
                  ),
                  SizedBox(height: 20),

                  CustomAnimatedButton(
                    onTap:  ()=> Modular.to.pushNamed("/login/singUp"),
                    widhtMultiply: 1,
                    height: 60,
                    text: "Cadastrar",
                    color: Color(0xff7C8A8A),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
