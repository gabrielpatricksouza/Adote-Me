import 'package:adote_me/Animacoes/FadeAnimation.dart';
import 'package:adote_me/Controller/C_Login/controller_login.dart';
import 'package:adote_me/View/Widgets/CustomAnimatedButton.dart';
import 'package:adote_me/View/Widgets/InputCustomizado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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

              _controllerLogin.registerStore.carregando
                  ? Center(
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff416d6d)),
                      backgroundColor: Color(0xff5C9999),
                    ),
                  )
                  : Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Observer(
                    builder: (_)=> Column(
                      children: [
                        FadeAnimation(0.2,
                            InputCustomizado(
                              icon: Icons.mail,
                              labelText: "Nome",
                              keyboardType: TextInputType.text,
                              onChanged: _controllerLogin.registerStore.setNome,
                            )
                        ),
                        SizedBox(height: 20),

                        FadeAnimation(0.4,
                            InputCustomizado(
                              icon: Icons.mail,
                              labelText: "E-mail",
                              hintText: "Insira e-mail válido",
                              keyboardType: TextInputType.emailAddress,
                              onChanged: _controllerLogin.registerStore.setEmail,
                            )
                        ),
                        SizedBox(height: 20),

                        FadeAnimation(0.6,
                            InputCustomizado(
                              icon: Icons.lock,
                              labelText: "Senha",
                              iconSuffix: _controllerLogin.registerStore.visualizar
                                  ?  Icons.visibility_off
                                  :  Icons.visibility,
                              onTapGesture: _controllerLogin.registerStore.boolVisualizar,
                              obscure: _controllerLogin.registerStore.visualizar,
                              onChanged: _controllerLogin.registerStore.setsenha1,
                              keyboardType: TextInputType.visiblePassword,
                            )
                        ),
                        SizedBox(height: 20),

                        FadeAnimation(0.8,
                            InputCustomizado(
                              icon: Icons.lock,
                              labelText: "Confirmar Senha",
                              iconSuffix: _controllerLogin.registerStore.visualizar
                                  ?  Icons.visibility_off
                                  :  Icons.visibility,
                              onTapGesture: _controllerLogin.registerStore.boolVisualizar2,
                              obscure: _controllerLogin.registerStore.visualizar,
                              onChanged: _controllerLogin.registerStore.setsenha2,
                              keyboardType: TextInputType.visiblePassword,
                            )
                        ),

                        _controllerLogin.registerStore.finalizar == false
                            ? Container()
                            : Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: CustomAnimatedButton(
                                onTap: () {
                                  _controllerLogin.registerStore.validandoCampos(context);
                                  if(_controllerLogin.registerStore.cadastrado){
                                    Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
                                  } else FocusScope.of(context).unfocus();
                                },
                                widhtMultiply: 1,
                                height: 60,
                                text: "Cadastrar",
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
