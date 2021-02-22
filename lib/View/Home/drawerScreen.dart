import 'package:adote_me/Controller/C_Home/controller_home.dart';
import 'package:adote_me/View/Utilits/CustomIconOrImage.dart';
import 'package:adote_me/View/Utilits/CustomShowDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'configuration.dart';

class DrawerScreen extends StatelessWidget {
  final _controllerHome = ControllerHome();

  @override
  Widget build(BuildContext context) {
    _controllerHome.userStore.checkLoggedUser();

    return Container(
      height: double.maxFinite,
      color: primaryGreen,
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          _controllerHome.userStore.loggedUser

          ? GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/home"),
            child: IconOrImage(
              text: "Nome User",))

          : GestureDetector(
              onTap: () =>Navigator.pushNamed(context, "/login"),
              child: IconOrImage(
                icon: Icons.login_outlined,
                text: "Entrar",)),


          Column(
            children: drawerItems
                .map((element) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () {
                          _controllerHome.userStore.loggedUser
                              ? Navigator.pushNamed(context, element['route'])
                              : Navigator.pushNamed(context, "/login");
                        },
                        child: Row(
                          children: [
                            Icon(
                              element['icon'],
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(width: 20),
                            Text(element['title'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20))
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),

          Observer(
            builder: (_) => Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Configurações',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 15),

             if (_controllerHome.userStore.loggedUser)
               GestureDetector(
                 onTap: () {
                   showDialog(
                       context: context,
                       builder: (_) => customShowDialog(
                           context,
                           "Você deseja mesmo sair?",
                           "/home",
                           _controllerHome.userStore.logOutUser
                       )
                   );
                   // _controllerHome.userStore.logOutUser();
                   // Navigator.pushNamedAndRemoveUntil(
                   //     context, "/home", (route) => false);
                 },
                 child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Sair',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
               ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
