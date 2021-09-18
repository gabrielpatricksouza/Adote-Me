import 'package:adote_me/app/modules/parceiros/store/parceiros_store.dart';
import 'package:adote_me/widgets/custom_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ParceirosPage extends StatefulWidget {
  @override
  _ParceirosPageState createState() => _ParceirosPageState();
}

class _ParceirosPageState extends ModularState<ParceirosPage, ParceirosStore> {
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
                      child: Column(
                        children: [
                          Text(
                            "Faça parte dessa causa também.\nEntre em contato conosco e vire um parceiro!",
                            style: TextStyle(fontSize: 20, color: Colors.black87),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 25.0,),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 100.0),
                            child: CustomAnimatedButton(
                              onTap: () async {
                                final link = WhatsAppUnilink(
                                  phoneNumber: "+55 (38) 991656566",
                                  text: "Olá! Venho do app Adote-me, e adoraria ser um parceiro.",
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
                ),
              ],
            )
        )
    );
  }
}
