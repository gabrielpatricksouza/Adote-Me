import 'package:adote_me/app/modules/sobre/store/sobre_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SobrePage extends StatefulWidget {
  @override
  _SobrePageState createState() => _SobrePageState();
}

class _SobrePageState extends ModularState<SobrePage, SobreStore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFF151730),
      child: Center(
        child: Text("Modulo Portfólio", style: TextStyle(fontSize: 35, color: Colors.white),),
      ),
    );
  }
}
