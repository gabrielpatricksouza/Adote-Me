import 'package:adote_me/Animacoes/FadeAnimation.dart';
import 'package:adote_me/View/Widgets/CustomAnimatedButton.dart';
import 'package:adote_me/View/Widgets/InputCustomizado.dart';
import 'package:flutter/material.dart';

class SingIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //qualquer toque no fora do teclado, fecha o teclado;
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/bemVindoTwo.png",
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FadeAnimation(0.2,
                    InputCustomizado(
                      icon: Icons.mail,
                      labelText: "E-mail",
                      keyboardType: TextInputType.text,
                    )
                  ),
                  SizedBox(height: 20),

                  FadeAnimation(0.4,
                      InputCustomizado(
                        icon: Icons.lock,
                        labelText: "Senha",
                        iconSuffix: Icons.visibility,
                        obscure: true,
                        keyboardType: TextInputType.visiblePassword,
                      )
                  ),
                  SizedBox(height: 30),

                  FadeAnimation(
                    0.6, CustomAnimatedButton(
                      onTap: () {},
                      widhtMultiply: 1,
                      height: 60,
                      text: "Entrar",
                    ),
                  ),
                  // SizedBox(height: 20),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
