import 'package:adote_me/Animacoes/FadeAnimation.dart';
import 'package:adote_me/Controller/C_Login/controller_login.dart';
import 'package:adote_me/View/Home/configuration.dart';
import 'package:adote_me/View/Widgets/CustomAnimatedButton.dart';
import 'package:adote_me/View/Widgets/CustomCircleAvatar.dart';
import 'package:adote_me/View/Widgets/InputCustomizado.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SingUp extends StatelessWidget {
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
                onPressed: () => Navigator.pop(context)),
          ),
          _controllerLogin.registerStore.carregando
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
                    child: SingleChildScrollView(
                      child: Observer(
                        builder: (_) =>  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              "assets/images/logo.png",
                              fit: BoxFit.cover,
                            ),
                          ),

                          if (_controllerLogin.registerStore.next  != true)
                          ...[
                            FadeAnimation(
                                0.2,
                                InputCustomizado(
                                  icon: Icons.person,
                                  hintText: "Nome",
                                  keyboardType: TextInputType.text,
                                  controller: _controllerLogin.registerStore.nomeController,
                                  onChanged:
                                  _controllerLogin.registerStore.setNome,
                                )),
                            SizedBox(height: 20),

                            FadeAnimation(
                                0.4,
                                InputCustomizado(
                                  icon: Icons.mail,
                                  hintText: "E-mail",
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _controllerLogin.registerStore.emailController,
                                  onChanged:
                                  _controllerLogin.registerStore.setEmail,
                                )),
                            SizedBox(height: 20),
                          ]
                          else
                            ...[
                            InputCustomizado(
                                  icon: Icons.lock,
                                  hintText: "Senha",
                                  suffixIcon: GestureDetector(
                                    onTap: _controllerLogin
                                        .registerStore.boolVisualizar,
                                    child: Icon(
                                      _controllerLogin.registerStore.visualizar
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  controller: _controllerLogin.registerStore.senhaController,
                                  obscure:
                                      _controllerLogin.registerStore.visualizar,
                                  onChanged:
                                      _controllerLogin.registerStore.setsenha1,
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                            SizedBox(height: 20),

                            InputCustomizado(
                                  icon: Icons.lock,
                                  hintText: "Confirmar Senha",
                                  suffixIcon: GestureDetector(
                                    onTap: _controllerLogin
                                        .registerStore.boolVisualizar2,
                                    child: Icon(
                                      _controllerLogin.registerStore.visualizar2
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  controller: _controllerLogin.registerStore.senha2Controller,
                                  obscure:
                                      _controllerLogin.registerStore.visualizar,
                                  onChanged:
                                      _controllerLogin.registerStore.setsenha2,
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                            SizedBox(height: 20),
                          ],

                          _controllerLogin.registerStore.next == false
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: FadeAnimation(
                                    0.6, CustomAnimatedButton(
                                      onTap: () {
                                        _controllerLogin.registerStore
                                            .validandoNomeEmail(context);
                                        FocusScope.of(context).unfocus();

                                      },
                                      widhtMultiply: 1,
                                      height: 60,
                                      text: "Próximo",
                                    ),
                                  ),
                                )

                              : Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: CustomAnimatedButton(
                                      onTap: () {
                                        _controllerLogin.registerStore
                                            .validandoSenhas(context);
                                          FocusScope.of(context).unfocus();
                                      },
                                      widhtMultiply: 1,
                                      height: 60,
                                      text: "Cadastrar",
                                    ),),

                          Padding(
                              padding: EdgeInsets.only(top: 30),
                            child: FadeAnimation(
                              0.8, Row(
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
                             1, Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  GestureDetector(
                                    onTap: (){
                                      _controllerLogin.registerStore
                                          .registerWithGoogle(context);
                                      FocusScope.of(context).unfocus();
                                    },
                                    child: CustomCircleAvatar(
                                      icon: FontAwesomeIcons.google,
                                      color: Colors.redAccent,
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: (){
                                      _controllerLogin.registerStore
                                          .registerWithFacebook(context);
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
                        ],
                      ),
                    ),
                  ),
                )
        ],
      )),
    );
  }
}
