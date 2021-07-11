import 'package:adote_me/app/modules/login/store/register_store.dart';
import 'package:adote_me/constants/constantes.dart';
import 'package:adote_me/widgets/InputCustomizado.dart';
import 'package:adote_me/widgets/custom_animated_button.dart';
import 'package:adote_me/widgets/custom_circle_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SingUp extends StatelessWidget {
  final RegisterStore _controllerLogin = Modular.get();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: Observer(
        builder: (_) => Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/bemVindoTwo.png",
                fit: BoxFit.cover,
              ),
            ),
            if (_controllerLogin.carregando == false)
              Positioned(
                top: 20,
                left: 0,
                child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_outlined),
                    iconSize: 30,
                    onPressed: () => Navigator.pop(context)),
              ),
            _controllerLogin.carregando
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: SpinKitWave(
                          color: primaryGreen,
                          size: 45,
                        ))
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38.0),
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification:
                          (OverscrollIndicatorNotification overscroll) {
                        overscroll.disallowGlow();
                        return true;
                      },
                      child: SingleChildScrollView(
                        child: Observer(
                          builder: (_) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  "assets/images/logo.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              if (_controllerLogin.next != true) ...[
                                InputCustomizado(
                                  icon: Icons.person,
                                  labelText: "Nome",
                                  labelStyle: TextStyle(
                                      color: Colors.grey[700]
                                  ),
                                  fillColor: Color(0xffCAE0E0),
                                  keyboardType: TextInputType.text,
                                  controller: _controllerLogin.nomeController,
                                  onChanged: _controllerLogin.setNome,
                                ),
                                SizedBox(height: 20),
                                InputCustomizado(
                                  icon: Icons.mail,
                                  labelText: "E-mail",
                                  labelStyle: TextStyle(
                                      color: Colors.grey[700]
                                  ),
                                  fillColor: Color(0xffCAE0E0),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _controllerLogin.emailController,
                                  onChanged: _controllerLogin.setEmail,
                                ),
                                SizedBox(height: 20),
                              ] else ...[
                                InputCustomizado(
                                  icon: Icons.lock,
                                  labelText: "Senha",
                                  labelStyle: TextStyle(
                                      color: Colors.grey[700]
                                  ),
                                  fillColor: Color(0xffCAE0E0),
                                  suffixIcon: GestureDetector(
                                    onTap: _controllerLogin.boolVisualizar,
                                    child: Icon(
                                      _controllerLogin.visualizar
                                          ? Icons.visibility_off
                                          : Icons.visibility, color: Colors.grey[700],
                                    ),
                                  ),
                                  controller: _controllerLogin.senhaController,
                                  obscure: _controllerLogin.visualizar,
                                  onChanged: _controllerLogin.setsenha1,
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                                SizedBox(height: 20),
                                InputCustomizado(
                                  icon: Icons.lock,
                                  hintText: "Confirmar Senha",
                                  fillColor: Color(0xffCAE0E0),
                                  suffixIcon: GestureDetector(
                                    onTap: _controllerLogin.boolVisualizar2,
                                    child: Icon(
                                      _controllerLogin.visualizar2
                                          ? Icons.visibility_off
                                          : Icons.visibility, color: Colors.grey[700],
                                    ),
                                  ),
                                  controller: _controllerLogin.senha2Controller,
                                  obscure: _controllerLogin.visualizar,
                                  onChanged: _controllerLogin.setsenha2,
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                                SizedBox(height: 20),
                              ],
                              _controllerLogin.next == false
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: CustomAnimatedButton(
                                        onTap: () {
                                          _controllerLogin
                                              .validandoNomeEmail(context);
                                          FocusScope.of(context).unfocus();
                                        },
                                        widhtMultiply: 1,
                                        height: 60,
                                        color: Color(0XFF338fa0),
                                        text: "Próximo",
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: CustomAnimatedButton(
                                        onTap: () {
                                          _controllerLogin
                                              .validandoSenhas(context);
                                          FocusScope.of(context).unfocus();
                                        },
                                        widhtMultiply: 1,
                                        height: 60,
                                        color: Color(0XFF338fa0),
                                        text: "Cadastrar",
                                      ),
                                    ),
                              Padding(
                                padding: EdgeInsets.only(top: 30),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Divider(
                                      height: 20,
                                      color: Colors.black,
                                    )),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("OU"),
                                    ),
                                    Expanded(
                                        child: Divider(
                                      height: 20,
                                      color: Colors.black,
                                    )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _controllerLogin
                                            .registerWithGoogle(context);
                                        FocusScope.of(context).unfocus();
                                      },
                                      child: CustomCircleAvatar(
                                        icon: FontAwesomeIcons.google,
                                        color: Colors.redAccent,
                                      ),
                                    ),

                                    GestureDetector(
                                      onTap: () {
                                        _controllerLogin
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
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      )),
    );
  }
}
