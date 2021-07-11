import 'package:adote_me/app/app_controller.dart';
import 'package:adote_me/app/modules/template/store/template_store.dart';
import 'package:adote_me/constants/constantes.dart';
import 'package:adote_me/widgets/custom_button_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class TemplateMenuDrawer extends StatefulWidget {
  final Widget page;
  final String namePages;
  final Function changeFunction;

  const TemplateMenuDrawer({
    required this.page,
    required this.namePages,
    required this.changeFunction,
  });

  @override
  _TemplateMenuDrawerState createState() => _TemplateMenuDrawerState();
}

class _TemplateMenuDrawerState extends State<TemplateMenuDrawer> {

  @override
  Widget build(BuildContext context) {
    return SimpleHiddenDrawer(

      menu: Menu(),
      verticalScalePercent: 75,
      slidePercent: 60,

      screenSelectedBuilder: (position,controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor:  Color(0xffd7ecec),
            actions: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: controller.toggle,
                      iconSize: 27,),

                    Image.asset(
                      "assets/images/logoSmall.png", width: 80,
                    ),

                    IconButton(
                        iconSize: 27,
                        icon: Icon(Icons.favorite_border),
                        onPressed: (){widget.changeFunction(5);}
                    ),
                  ],
                ),
              )
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: primaryColor,
            child: widget.page,
          ),
        );
      },
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends ModularState<Menu, TemplateStore> {

  final AppController _controllerApp = Modular.get();
  final _scrollController = ScrollController();
  late SimpleHiddenDrawerController controllerDrawer;

  @override
  void didChangeDependencies() {
    controllerDrawer = SimpleHiddenDrawerController.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff416d6c),
      height: MediaQuery.of(context).size.height,
      child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffd7ecec),
                          radius: 25,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                  _controllerApp.usuario.urlImage.isEmpty
                                      ? "https://firebasestorage.googleapis.com/v0/b/adote-me-2ab97.appspot.com/o/perfil%2FlogoSmall.png?alt=media&token=9b551503-6e2e-4a69-afae-65cb71bbb43d"
                                      : _controllerApp.usuario.urlImage,
                                  fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0,),

                      Observer(
                        builder: (_) => Text(
                          _controllerApp.usuario.nome,
                          style: GoogleFonts.openSans(
                              fontSize: 20
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0,),

                  Flexible(
                    flex: 3,
                    child: Observer(
                      builder: (_) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30.0,),

                          CustomButtonMenu(
                            function: (){
                              _controllerApp.mudarRota(0);
                              controllerDrawer.close();
                            },
                            text: "Início",
                            index: 0,
                            seletedIndex: _controllerApp.index,
                            textIconColor: _controllerApp.index == 0 ? Color(0xff416d6c): Colors.white,
                            icon: FontAwesomeIcons.paw,
                            backgroundColor: _controllerApp.index == 0 ? Colors.white : Colors.transparent,
                          ),
                          SizedBox(height: 15),

                          CustomButtonMenu(
                            function: (){
                              controller.navegacaoAutenticada(1);
                              // _controllerApp.changeIndex(1);
                              controllerDrawer.close();
                            },
                            text: "Doação",
                            index: 1,
                            seletedIndex: _controllerApp.index,
                            textIconColor: _controllerApp.index == 1 ? Color(0xff416d6c): Colors.white,
                            icon:  FontAwesomeIcons.handHoldingHeart,
                            backgroundColor: _controllerApp.index == 1 ? Colors.white : Colors.transparent,
                          ),
                          SizedBox(height: 15),

                          CustomButtonMenu(
                            function: (){
                              controller.navegacaoAutenticada(2);
                              // _controllerApp.changeIndex(2);
                              controllerDrawer.close();
                            },
                            text: "Favoritos",
                            index: 2,
                            seletedIndex: _controllerApp.index,
                            textIconColor: _controllerApp.index == 2 ? Color(0xff416d6c): Colors.white,
                            icon:  Icons.favorite,
                            backgroundColor: _controllerApp.index == 2 ? Colors.white : Colors.transparent,
                          ),
                          SizedBox(height: 15),

                          CustomButtonMenu(
                            function: (){
                              _controllerApp.mudarRota(3);
                              controllerDrawer.close();
                            },
                            text: "Parceiros",
                            index: 3,
                            seletedIndex: _controllerApp.index,
                            textIconColor: _controllerApp.index == 3 ? Color(0xff416d6c): Colors.white,
                            icon:  FontAwesomeIcons.solidHandshake,
                            backgroundColor: _controllerApp.index == 3 ? Colors.white : Colors.transparent,
                          ),
                          SizedBox(height: 15),

                          CustomButtonMenu(
                            function: (){
                              _controllerApp.mudarRota(4);
                              controllerDrawer.close();
                            },
                            text: "Sobre",
                            index: 4,
                            seletedIndex: _controllerApp.index,
                            textIconColor: _controllerApp.index == 4 ? Color(0xff416d6c): Colors.white,
                            icon:  FontAwesomeIcons.question,
                            backgroundColor: _controllerApp.index == 4 ? Colors.white : Colors.transparent,
                          ),
                          SizedBox(height: 15,),

                          Spacer(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              IconButton(
                                onPressed: (){
                                  controller.deslogarUsuario();
                                  controllerDrawer.close();
                                },
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon: Icon(FontAwesomeIcons.signOutAlt,
                                  color: Colors.red,
                                ),
                              ),

                              IconButton(
                                onPressed: (){},
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon: Icon(FontAwesomeIcons.instagram,
                                  color: Colors.white,
                                ),
                              ),

                              IconButton(
                                onPressed: (){},
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                iconSize: 20,
                                icon: Icon(FontAwesomeIcons.info,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 15,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]
      ),
    );
  }
}
