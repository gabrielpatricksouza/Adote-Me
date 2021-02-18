import 'package:adote_me/View/Widgets/CustomAnimatedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    onTap:  ()=> Navigator.pushNamed(context, "/singIn"),
                    widhtMultiply: 1,
                    height: 60,
                    text: "Entrar",
                ),
                SizedBox(height: 20),

                CustomAnimatedButton(
                  onTap:  ()=> Navigator.pushNamed(context, "/singUp"),
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
    );
  }
}
