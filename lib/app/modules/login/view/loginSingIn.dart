import 'package:adote_me/app/modules/login/store/login_store.dart';
import 'package:adote_me/constants/constantes.dart';
import 'package:adote_me/utility/recuperar_senha_alert.dart';
import 'package:adote_me/widgets/InputCustomizado.dart';
import 'package:adote_me/widgets/custom_animated_button.dart';
import 'package:adote_me/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingIn extends StatelessWidget {
  final LoginStore _controllerLogin = Modular.get();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

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

              if(_controllerLogin.carregando == false)
              Positioned(
                  top: 20,
                  left: 0,
                  child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_outlined),
                      iconSize: 30,
                      onPressed: () => Navigator.pop(context)
                  ),
              ),

            if (_controllerLogin.carregando) Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(child: SpinKitWave(color: primaryGreen, size: 45,))
                    ],
                  ),
                ) else Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return true;
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

                        InputCustomizado(
                            icon: Icons.mail,
                            labelText: "E-mail",
                            labelStyle: TextStyle(
                              color: Colors.grey[700]
                            ),
                            fillColor:  Color(0xffCAE0E0),
                            keyboardType: TextInputType.emailAddress,
                            controller: _controllerLogin.emailController,
                            onChanged: _controllerLogin.setEmail,
                          ),
                        SizedBox(height: 20),

                    Observer(
                          builder: (_) => InputCustomizado(
                            icon: Icons.lock,
                            labelText: "Senha",
                            labelStyle: TextStyle(
                                color: Colors.grey[700]
                            ),
                            fillColor:  Color(0xffCAE0E0),
                            suffixIcon: GestureDetector(
                              onTap: _controllerLogin.boolVisualizar,
                              child:  Icon(_controllerLogin.visualizar
                                  ?  Icons.visibility_off
                                  :  Icons.visibility, color: Colors.grey[700],),
                            ),
                            controller: _controllerLogin.senhaController,
                            obscure: _controllerLogin.visualizar,
                            onChanged: _controllerLogin.setSenha,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        SizedBox(height: 30),

                        CustomAnimatedButton(
                          onTap: () {
                            _controllerLogin.signInWithEmailAndPassword(context);
                          },
                          widhtMultiply: 1,
                          height: 60,
                          color: Color(0XFF338fa0),
                          text: "Entrar",
                        ),

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

                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                    height: 20,
                                    color: Colors.black,
                                  )
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text("OU", style: TextStyle(color: Colors.grey[700]),),
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

                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              GestureDetector(
                                onTap: (){
                                  _controllerLogin.singInWithGoogle(context);
                                  FocusScope.of(context).unfocus();
                                },
                                child: CustomCircleAvatar(
                                  icon: FontAwesomeIcons.google,
                                  color: Colors.redAccent,
                                ),
                              ),

                              GestureDetector(
                                onTap: (){
                                  _controllerLogin.singInWithFacebook(context);
                                  FocusScope.of(context).unfocus();
                                },
                                child: CustomCircleAvatar(
                                  icon: FontAwesomeIcons.facebookF,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
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
