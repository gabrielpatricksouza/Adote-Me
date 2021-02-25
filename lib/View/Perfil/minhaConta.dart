import 'package:adote_me/Animacoes/FadeAnimation.dart';
import 'package:adote_me/Controller/C_Perfil/controller_perfil.dart';
import 'package:adote_me/View/Alerts/AlterarEmailAlert.dart';
import 'package:adote_me/View/Alerts/ConfirmacaoAlert.dart';
import 'package:adote_me/View/Widgets/CustomAnimatedButton.dart';
import 'package:flutter/material.dart';

class MinhaConta extends StatelessWidget {
  final Map dados;
  MinhaConta(this.dados);

  final _controllerPerfil = ControllerPerfil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffd7ecec),

        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: FadeAnimation(
                    0.2, IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                            Icons.arrow_back_ios_outlined,
                            size: 30,
                        ),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 25),
                child: FadeAnimation(
                    0.4, CircleAvatar(
                      backgroundColor: Color(0xffd7ecec),
                      radius: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                              dados['urlImage'] == ""
                                  ?'https://firebasestorage.googleapis.com/v0/b/adote-me-2ab97.appspot.com/o/perfil%2FlogoSmall.png?alt=media&token=9b551503-6e2e-4a69-afae-65cb71bbb43d'
                                  : dados['urlImage'],
                              fit: BoxFit.contain,
                              loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(

                                  child: CircularProgressIndicator(
                                    valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff416d6d)),
                                    backgroundColor: Color(0xff5C9999),
                                    value: loadingProgress.expectedTotalBytes != null ?
                                    loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                        : null,
                                  ),
                                );
                              }
                          ),
                        ),
                      ),
                    ),
                ),
              ),
              FadeAnimation(0.6,
                Text(
                  "Minha Conta",
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.black,
                    fontFamily: "Calibre-Semibold",
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              SizedBox(height: 90,),
              Expanded(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowGlow();
                      return;
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: ListView(
                        // shrinkWrap: true,
                        children: [
                          FadeAnimation(0.8,
                              CustomAnimatedButton(
                                  widhtMultiply: 1,
                                  height: 60,
                                  text: "Alterar e-mail",
                                  onTap: (){
                                    alterarEmail(context);
                                  },
                              )
                          ),
                          SizedBox(height: 32,),

                          FadeAnimation(1,
                              CustomAnimatedButton(
                                widhtMultiply: 1,
                                height: 60,
                                text: "Alterar senha",
                                onTap: (){
                                  _controllerPerfil.userStore.recuperandoSenha(dados['urlImage']);
                                },
                              )
                          ),
                          SizedBox(height: 32,),

                          FadeAnimation(1.2,
                            CustomAnimatedButton(
                              widhtMultiply: 1,
                              height: 60,
                              text: "Excluir conta",
                              onTap: (){
                                confirmacao(context);
                              },
                            ),
                          ),
                          SizedBox(height: 16,),

                        ],
                      ),
                    ),
                  )
              ),
            ],
          ),
        )

    );
  }
}
