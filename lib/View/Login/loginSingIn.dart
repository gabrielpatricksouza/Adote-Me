import 'package:adote_me/Animacoes/FadeAnimation.dart';
import 'package:adote_me/Controller/C_Login/controller_login.dart';
import 'package:adote_me/View/Alerts/RecuperarSenhaAlert.dart';
import 'package:adote_me/View/Home/configuration.dart';
import 'package:adote_me/View/Widgets/CustomAnimatedButton.dart';
import 'package:adote_me/View/Widgets/CustomCircleAvatar.dart';
import 'package:adote_me/View/Widgets/InputCustomizado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        body: Observer(
          builder: (_) =>  Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/bemVindoTwo.png",
                  fit: BoxFit.cover,
                ),
              ),

              if(_controllerLogin.loginStore.carregando == false)
              Positioned(
                  top: 20,
                  left: 0,
                  child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_outlined),
                      iconSize: 30,
                      onPressed: () => Navigator.pop(context)
                  ),
              ),

            _controllerLogin.loginStore.carregando
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(child: SpinKitWave(color: primaryGreen, size: 45,))
                    ],
                  ),
                )
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return;
                  },
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
                            controller: _controllerLogin.loginStore.emailController,
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
                                controller: _controllerLogin.loginStore.senhaController,
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
                              _controllerLogin.loginStore.signInWithEmailAndPassword(context);
                            },
                            widhtMultiply: 1,
                            height: 60,
                            text: "Entrar",
                          ),
                        ),

                        FadeAnimation(0.8,
                          Container(
                            height: 40,
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

                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: FadeAnimation(
                            1, Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                    height: 20,
                                    color: Colors.black,
                                  )
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text("OU"),
                              ),

                              Expanded(
                                  child: Divider(
                                    height: 20,
                                    color: Colors.black,
                                  )
                              ),
                            ],
                          ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: FadeAnimation(
                            1.2, Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              GestureDetector(
                                onTap: (){
                                  _controllerLogin.loginStore
                                      .singInWithGoogle(context);
                                  FocusScope.of(context).unfocus();
                                },
                                child: CustomCircleAvatar(
                                  icon: FontAwesomeIcons.google,
                                  color: Colors.redAccent,
                                ),
                              ),

                              GestureDetector(
                                onTap: (){
                                  _controllerLogin.loginStore
                                      .singInWithFacebook(context);
                                  FocusScope.of(context).unfocus();
                                },
                                child: CustomCircleAvatar(
                                  icon: FontAwesomeIcons.facebookF,
                                  color: Colors.blue,
                                ),
                              ),

                              // CustomCircleAvatar(
                              //   icon: FontAwesomeIcons.twitter,
                              //   color: Colors.lightBlueAccent,
                              // ),
                            ],
                          ),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
