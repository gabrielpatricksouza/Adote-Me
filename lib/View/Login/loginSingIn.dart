import 'package:adote_me/Animacoes/FadeAnimation.dart';
import 'package:adote_me/Controller/C_Login/controller_login.dart';
import 'package:adote_me/View/Alert/RecuperarSenhaAlert.dart';
import 'package:adote_me/View/Home/configuration.dart';
import 'package:adote_me/View/Widgets/CustomAnimatedButton.dart';
import 'package:adote_me/View/Widgets/InputCustomizado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SingIn extends StatelessWidget {
  final _controllerLogin = ControllerLogin();

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
              padding: const EdgeInsets.symmetric(horizontal: 38.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.cover,
                      ),
                    ),

                    FadeAnimation(0.2,
                      InputCustomizado(
                        icon: Icons.mail,
                        labelText: "E-mail",
                        keyboardType: TextInputType.text,
                        controller: _controllerLogin.emailController,
                        onChanged: _controllerLogin.loginStore.setEmail,
                      )
                    ),
                    SizedBox(height: 20),

                    FadeAnimation(0.4,
                        Observer(
                          builder: (_) => InputCustomizado(
                            icon: Icons.lock,
                            labelText: "Senha",
                            suffixIcon: GestureDetector(
                              onTap: _controllerLogin.loginStore.boolVisualizar,
                              child:  Icon(_controllerLogin.loginStore.visualizar
                                  ?  Icons.visibility_off
                                  :  Icons.visibility),
                            ),
                            controller: _controllerLogin.senhaController,
                            obscure: _controllerLogin.loginStore.visualizar,
                            onChanged: _controllerLogin.loginStore.setSenha,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        )
                    ),
                    SizedBox(height: 30),

                    FadeAnimation(
                      0.6, CustomAnimatedButton(
                        onTap: () {
                          _controllerLogin.loginStore.logarUsuario(context);
                          if(_controllerLogin.loginStore.resultado == true){
                            Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
                          }
                        },
                        widhtMultiply: 1,
                        height: 60,
                        text: "Entrar",
                      ),
                    ),

                    FadeAnimation(0.8,
                      Container(
                        height: 40,
                        padding: EdgeInsets.only(right: 8),
                        alignment: Alignment.center,
                        child: GestureDetector(
                          child: Text(
                            "Recuperar Senha",
                            style: TextStyle(
                                color: primaryGreen),
                          ),
                          onTap: (){
                            recuperarSenha(context);
                          },
                        ),
                      ),
                    ),
                    // SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
