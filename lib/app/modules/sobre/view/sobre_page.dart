import 'package:adote_me/app/modules/sobre/store/sobre_store.dart';
import 'package:adote_me/widgets/custom_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class SobrePage extends StatefulWidget {
  @override
  _SobrePageState createState() => _SobrePageState();
}

class _SobrePageState extends ModularState<SobrePage, SobreStore> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xffd7ecec),
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Material(
                    elevation: 10,
                    color: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "\t\tO aplicativo tem como missão conectar doadores de pets com adotadores, "
                        "de modo gratuito e sem anúncio depedendo apenas de parceiros e colaboradoes.",
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                        textAlign: TextAlign.justify,
                      ),
                    )
                ),

                SizedBox(height: 25.0,),


                Material(
                    elevation: 10,
                    color: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [

                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/adote-me-2ab97.appspot.com/o/perfil%2Fpp%20(1).jpg?alt=media&token=cdb2339d-938e-419e-884c-3777cac0c542"),
                            backgroundColor: Colors.grey,
                          ),

                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Desenvolvedor",
                                  style: TextStyle(fontSize: 20, color: Colors.black87),
                                  textAlign: TextAlign.justify,
                                  softWrap: true,
                                ),
                                SizedBox(height: 25.0,),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                  child: CustomAnimatedButton(
                                    onTap: () async {
                                      final link = WhatsAppUnilink(
                                        phoneNumber: "+55 (38) 991656566",
                                        text: "Olá! Venho do app Adote-me, e adoraria falar com você.",
                                      );
                                      await launch('$link', forceWebView: false, forceSafariVC: false);
                                    },
                                    iconBool: true,
                                    icon: FontAwesome.whatsapp,
                                    widhtMultiply: 1,
                                    height: 40,
                                    color: Colors.green.shade500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ),

                SizedBox(height: 25.0,),Material(
                    elevation: 10,
                    color: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [

                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/adote-me-2ab97.appspot.com/o/perfil%2Fpp.jpg?alt=media&token=c7b4343f-0352-44c2-88ee-0e7e7161bcee"),
                            backgroundColor: Colors.grey,
                          ),

                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Co-fundador",
                                  style: TextStyle(fontSize: 20, color: Colors.black87),
                                  textAlign: TextAlign.justify,
                                  softWrap: true,
                                ),
                                SizedBox(height: 25.0,),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                  child: CustomAnimatedButton(
                                    onTap: () async {
                                      final link = WhatsAppUnilink(
                                        phoneNumber: "+55 (38) 992446677",
                                        text: "Olá! Venho do app Adote-me, e adoraria falar com você.",
                                      );
                                      await launch('$link', forceWebView: false, forceSafariVC: false);
                                    },
                                    iconBool: true,
                                    icon: FontAwesome.whatsapp,
                                    widhtMultiply: 1,
                                    height: 40,
                                    color: Colors.green.shade500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ),
                SizedBox(height: 25.0,),
              ],
            )
        )
    );
  }
}
