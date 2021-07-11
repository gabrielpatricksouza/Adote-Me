import 'package:adote_me/app/modules/parceiros/store/parceiros_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ParceirosPage extends StatefulWidget {
  @override
  _ParceirosPageState createState() => _ParceirosPageState();
}

class _ParceirosPageState extends ModularState<ParceirosPage, ParceirosStore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFF151730),
      child: Center(
        child: Text("Modulo Serviços", style: TextStyle(fontSize: 35, color: Colors.white),),
      ),
    );
  }
}
