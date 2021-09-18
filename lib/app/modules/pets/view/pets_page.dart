import 'package:adote_me/app/modules/pets/store/pets_store.dart';
import 'package:adote_me/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PetsPage extends StatefulWidget {
  @override
  _PetsPageState createState() => _PetsPageState();
}

class _PetsPageState extends ModularState<PetsPage, PetsStore> {

  @override
  void initState() {
    controller.buscarAnimais();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xffd7ecec), //Color(0xff161621),
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: Observer(
          builder: (_) => controller.carregando ?
          Center(
              child: SpinKitFadingCube(
                size: 45,
                color: Color(0xff198d97),
              ))
              : controller.listaAnimais.length == 0
              ? Center(
                child: Text(
                  "Sem Pets!",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black
                  ),
                ),
              )
              : ListView.builder(
              itemCount: controller.listaAnimais.length,
              itemBuilder: (context, index) {
                return CustomCard(
                    animal: controller.listaAnimais[index],
                    icon: Icons.delete_forever_outlined,
                    color: Colors.red,
                    action: (){
                      controller.deletarPet(
                          controller.listaAnimais[index].idPet
                        );
                    },
                    foto: controller.listaAnimais[index].imagensPet![0]);
              }),
        ),
      ),
    );
  }
}
