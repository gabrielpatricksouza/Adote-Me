import 'package:adote_me/app/modules/favoritos/store/favoritos_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
class FavoritosPage extends StatefulWidget {
  @override
  _FavoritosPageState createState() => _FavoritosPageState();
}

class _FavoritosPageState extends ModularState<FavoritosPage, FavoritosStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff151730),//Color(0xff161621),
        body: Container()
    );
  }
}
