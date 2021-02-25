import 'package:adote_me/Controller/C_Drawer/controller_drawer.dart';
import 'package:adote_me/View/Utilits/CustomDrawerButtom.dart';
import 'package:adote_me/View/Utilits/CustomIconOrImage.dart';
import 'package:adote_me/View/Utilits/CustomShowDialog.dart';
import 'package:adote_me/bloc/Navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeDrawer extends StatefulWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> menuAnimation;
  final int selectedIndex;
  final Function onMenuItemClicked;

  const HomeDrawer({Key key, this.slideAnimation, this.menuAnimation, this.selectedIndex, @required this.onMenuItemClicked}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final _controllerDrawer = ControllerDrawer();

  @override
  void initState() {
    _controllerDrawer.userStore.checkLoggedUser();
    _controllerDrawer.userStore.recuperandoDadosUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.slideAnimation,
      child: ScaleTransition(
        scale: widget.menuAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: _controllerDrawer.userStore.loggedUser
                  ? Observer(
                  builder: (_) {
                    return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context,
                            "/minhaConta",
                            arguments: {
                              'urlImage': _controllerDrawer.userStore.urlImagem,
                              'email'   : _controllerDrawer.userStore.email
                            }
                        ),
                        child: IconOrImage(
                          foto:  _controllerDrawer.userStore.urlImagem,
                          text: _controllerDrawer.userStore.nome,)
                    );
                  }
              )

                  : GestureDetector(
                  onTap: () =>Navigator.pushNamed(context, "/login"),
                  child: IconOrImage(
                    icon: Icons.login_outlined,
                    text: "Entrar",)),
            ),

            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomeClickedEvent);
                        widget.onMenuItemClicked();
                      },
                      child: CustomDrawerButtom(
                        text: "Início",
                        icon: FontAwesomeIcons.paw,
                        seletedIndex: widget.selectedIndex,
                        index: 0,
                      )
                    ),
                    SizedBox(height: 20),

                    GestureDetector(
                      onTap: () {
                        if(_controllerDrawer.userStore.loggedUser) {
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.DonationClickedEvent);
                            widget.onMenuItemClicked();
                          }
                         else Navigator.pushNamed(context, "/login");
                        },
                      child: CustomDrawerButtom(
                          text: "Doação",
                          icon: FontAwesomeIcons.handHoldingHeart,
                          seletedIndex: widget.selectedIndex,
                          index: 1
                      )
                    ),

                    SizedBox(height: 20),

                    GestureDetector(
                      onTap: () {
                        if(_controllerDrawer.userStore.loggedUser) {
                          // BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MessagesClickedEvent);
                          widget.onMenuItemClicked();
                        }
                        else Navigator.pushNamed(context, "/login");
                      },
                      child: CustomDrawerButtom(
                          text: "Favoritos",
                          icon: Icons.favorite,
                          seletedIndex: widget.selectedIndex,
                          index: 2
                      )
                    ),

                    SizedBox(height: 20),

                    GestureDetector(
                        onTap: () {
                          // BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.UtilityClickedEvent);
                          widget.onMenuItemClicked();
                        },
                        child: CustomDrawerButtom(
                            text: "Parceiros",
                            icon: FontAwesomeIcons.solidHandshake,
                            seletedIndex: widget.selectedIndex,
                            index: 3
                        )
                    ),

                    SizedBox(height: 20),

                    GestureDetector(
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.AboutClickedEvent);
                          widget.onMenuItemClicked();
                        },
                        child: CustomDrawerButtom(
                            text: "Sobre",
                            icon: FontAwesomeIcons.question,
                            seletedIndex: widget.selectedIndex,
                            index: 4
                        )
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child:  Observer(
                  builder: (_) => _controllerDrawer.userStore.loggedUser != true
                      ? Container()
                      : GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => customShowDialog(
                                  context,
                                  "Sair do Adote-me?",
                                  "/home",
                                  _controllerDrawer.userStore.logOutUser
                              )
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Desconectar',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white, fontWeight: FontWeight.normal
                              ),
                            )
                          ],
                        ),
                      )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
