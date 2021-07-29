import 'package:adote_me/app/modules/home/store/home_store.dart';
import 'package:adote_me/app/modules/home/view/screenDetails.dart';
import 'package:adote_me/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {


  @override
  void initState() {
    controller.buscarAnimais();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BuildContext contextGlobal = context;

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
                    return InkWell(
                        onTap: () async {
                          await showDialog(
                              context: context,
                              builder: (_) => ScreenDetails(
                                    local: 'home',
                                    animal: controller.listaAnimais[index],
                                    controller: controller,
                                  ));
                        },
                        child: CustomCard(
                            animal: controller.listaAnimais[index],
                            action: (){
                              controller.favoritarPet(
                                  contextGlobal, controller.listaAnimais[index].idPet);
                            },
                            foto: controller.listaAnimais[index].imagensPet![0])
                    );
                  }),
        ),
      ),
    );
  }
}
