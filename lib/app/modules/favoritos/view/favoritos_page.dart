import 'package:adote_me/app/modules/favoritos/store/favoritos_store.dart';
import 'package:adote_me/app/modules/home/view/screenDetails.dart';
import 'package:adote_me/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class FavoritosPage extends StatefulWidget {
  @override
  _FavoritosPageState createState() => _FavoritosPageState();
}

class _FavoritosPageState extends ModularState<FavoritosPage, FavoritosStore> {

  @override
  void initState() {
    controller.buscarAnimais();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BuildContext contextGlobal = context;

    return Scaffold(
        backgroundColor: Color(0xffd7ecec),//Color(0xff161621),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: Observer(
            builder: (_) => controller.carregando
                ? Center(
                child: SpinKitFadingCube(
                  size: 45,
                  color: Color(0xff198d97),
                ))
                : ListView.builder(
                itemCount: controller.listaAnimaisFavoritados.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (_) => ScreenDetails(
                              local: 'favoritos',
                              animal: controller.listaAnimaisFavoritados[index],
                            ));
                      },
                      child: CustomCard(
                          animal: controller.listaAnimaisFavoritados[index],
                          icon: Icons.clear,
                          color: Colors.red,
                          action: (){
                            controller.desfavoritarPet(
                                contextGlobal,
                                controller.listaAnimaisFavoritados[index].idPet,
                                controller.listaAnimaisFavoritados[index].nomePet
                            );
                          },
                          foto:
                          controller.listaAnimaisFavoritados[index].imagensPet![0]));
                }),
          ),
        ),
    );
  }
}
