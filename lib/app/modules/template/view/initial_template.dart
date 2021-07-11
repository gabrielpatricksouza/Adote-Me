import 'package:adote_me/app/app_controller.dart';
import 'package:adote_me/app/modules/template/store/template_store.dart';
import 'package:adote_me/app/modules/template/view/template_menu_drawer.dart';
import 'package:adote_me/constants/constantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Template extends StatefulWidget {

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends ModularState<Template, TemplateStore> {
  final AppController appController = Modular.get();

  @override
  void initState() {
    appController.recuperarDadosUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Observer(
          builder: (_) =>  TemplateMenuDrawer(
            page: pages[appController.index],
            namePages: namePages[appController.index],
            changeFunction: appController.mudarRota,
          ),
        ),
      ),
    );
  }
}
