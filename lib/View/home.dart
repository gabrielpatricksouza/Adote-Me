// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
// import 'package:responsive_builder/responsive_builder.dart';
//
// import 'Widgets/custom_button_menu.dart';
//
// class TemplateMenuDrawer extends StatefulWidget {
//
//
//   @override
//   _TemplateMenuDrawerState createState() => _TemplateMenuDrawerState();
// }
//
// class _TemplateMenuDrawerState extends State<TemplateMenuDrawer> {
//
//   Color primaryColor = Color(0xff1F1F30);
//
//
// /* Listas */
//   List<Widget> pages = [
//     // HomePage(),
//     // SobrePage(),
//     // ExplorarPage(),
//     // ServicosPage(),
//     // PortfolioPage(),
//     // ContatoPage()
//   ];
//
//   List<String> namePages = [
//     "Scaffold",
//     "Sobre",
//     "Explorar",
//     "Serviços",
//     "Portfólio",
//     "Contato"
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SimpleHiddenDrawer(
//
//       menu: Menu(),
//       verticalScalePercent: getValueForScreenType<double>(
//         context: context, mobile: 82, tablet: 88,),
//
//       slidePercent: getValueForScreenType<double>(
//         context: context, mobile: 30, tablet: 15,),
//
//       screenSelectedBuilder: (position,controller) {
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: Color(0xff1c1c2a),
//             title: Text(
//               namePages[0],
//               style: GoogleFonts.openSans(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25,
//                   color: Colors.white
//               ),
//             ),
//             leading: IconButton(
//               icon: Icon(Icons.menu),
//               onPressed: controller.toggle,
//               iconSize: 27,
//               color: Colors.pinkAccent,),
//
//             actions: [
//               IconButton(
//                   iconSize: 27,
//                   icon: Icon(Icons.explore_outlined),
//                   color: Colors.pinkAccent,
//                   onPressed: (){}
//               ),
//             ],
//           ),
//           body: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             color: primaryColor,
//             child: Container(),
//           ),
//         );
//       },
//     );
//   }
// }
//
// class Menu extends StatefulWidget {
//   @override
//   _MenuState createState() => _MenuState();
// }
//
// class _MenuState extends ModularState<Menu> {
//
//   final AppController _controllerApp = Modular.get();
//   final _scrollController = ScrollController();
//   SimpleHiddenDrawerController controllerDrawer;
//
//   @override
//   void didChangeDependencies() {
//     controllerDrawer = SimpleHiddenDrawerController.of(context);
//     super.didChangeDependencies();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xff0f1123),
//       height: MediaQuery.of(context).size.height,
//       child: CustomScrollView(
//           controller: _scrollController,
//           slivers: [
//             SliverFillRemaining(
//               hasScrollBody: false,
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 40, bottom: 20),
//                         child: InkWell(
//                             onTap: (){
//                               _controllerApp.changeIndex(0);
//                               controllerDrawer.close();
//                             },
//                             child: Text(
//                               "S",
//                               style: TextStyle(
//                                   fontFamily: "Colonna",
//                                   fontSize: 70
//                               ),
//                             )
//                         ),
//                       ),
//                       SizedBox(width: 10.0,),
//
//
//                     ],
//                   ),
//
//                   Flexible(
//                     flex: 3,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 40.0),
//                       child: Observer(
//                         builder: (_) => Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//
//                             CustomButtonMenu(
//                               function: (){
//                                 _controllerApp.changeIndex(0);
//                                 controllerDrawer.close();
//                               },
//                               text: "Home",
//                               textIconColor: _controllerApp.index == 0 ? Colors.white : Color(0XFF788aff),
//                               icon: Icons.home_outlined,
//                               backgroundColor: _controllerApp.index == 0 ? Colors.white12 : Colors.transparent,
//                             ),
//                             SizedBox(height: getValueForScreenType<double>(
//                               context: context, mobile: 15, tablet: 30,)),
//
//                             CustomButtonMenu(
//                               function: (){
//                                 _controllerApp.changeIndex(1);
//                                 controllerDrawer.close();
//                               },
//                               text: "Sobre",
//                               textIconColor: _controllerApp.index == 1 ? Colors.white : Color(0XFF788aff),
//                               icon: Icons.contact_support_outlined,
//                               backgroundColor: _controllerApp.index == 1 ? Colors.white12 : Colors.transparent,
//                             ),
//                             SizedBox(height: getValueForScreenType<double>(
//                               context: context, mobile: 15, tablet: 30,)),
//
//                             CustomButtonMenu(
//                               function: (){
//                                 _controllerApp.changeIndex(2);
//                                 controllerDrawer.close();
//                               },
//                               text: "Imersão",
//                               textIconColor: _controllerApp.index == 2 ? Colors.white : Color(0XFF788aff),
//                               icon: Icons.explore_outlined,
//                               backgroundColor: _controllerApp.index == 2 ? Colors.white12 : Colors.transparent,
//                             ),
//                             SizedBox(height: getValueForScreenType<double>(
//                               context: context, mobile: 15, tablet: 30,)),
//
//                             CustomButtonMenu(
//                               function: (){
//                                 _controllerApp.changeIndex(3);
//                                 controllerDrawer.close();
//                               },
//                               text: "Serviços",
//                               textIconColor: _controllerApp.index == 3 ? Colors.white : Color(0XFF788aff),
//                               icon: Icons.work_outline_rounded,
//                               backgroundColor: _controllerApp.index == 3 ? Colors.white12 : Colors.transparent,
//                             ),
//                             SizedBox(height: getValueForScreenType<double>(
//                               context: context, mobile: 15, tablet: 30,)),
//
//                             CustomButtonMenu(
//                               function: (){
//                                 _controllerApp.changeIndex(4);
//                                 controllerDrawer.close();
//                               },
//                               text: "Portifólio",
//                               textIconColor: _controllerApp.index == 4 ? Colors.white : Color(0XFF788aff),
//                               icon: Icons.image_search_outlined,
//                               backgroundColor: _controllerApp.index == 4 ? Colors.white12 : Colors.transparent,
//                             ),
//                             SizedBox(height: 25,),
//
//                             CustomButtonMenu(
//                               function: (){
//                                 _controllerApp.changeIndex(5);
//                                 controllerDrawer.close();
//                               },
//                               text: "Contato",
//                               textIconColor: _controllerApp.index == 5 ? Colors.white : Color(0XFF788aff),
//                               icon: Icons.perm_contact_calendar_outlined,
//                               backgroundColor: _controllerApp.index == 5 ? Colors.white12 : Colors.transparent,
//                             ),
//                             SizedBox(height: 15,),
//
//                             Spacer(),
//
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//
//                                 IconButton(
//                                   onPressed: (){},
//                                   splashColor: Colors.transparent,
//                                   hoverColor: Colors.transparent,
//                                   highlightColor: Colors.transparent,
//                                   icon: Icon(FontAwesomeIcons.signOutAlt,
//                                     color: Color(0xd5d21733),
//                                   ),
//                                 ),
//
//                                 IconButton(
//                                   onPressed: (){},
//                                   splashColor: Colors.transparent,
//                                   hoverColor: Colors.transparent,
//                                   highlightColor: Colors.transparent,
//                                   icon: Icon(FontAwesomeIcons.instagram,
//                                     color: Colors.grey[700],
//                                   ),
//                                 ),
//
//                                 IconButton(
//                                   onPressed: (){},
//                                   splashColor: Colors.transparent,
//                                   hoverColor: Colors.transparent,
//                                   highlightColor: Colors.transparent,
//                                   iconSize: 20,
//                                   icon: Icon(FontAwesomeIcons.question,
//                                     color: Colors.grey[700],
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//                             SizedBox(height: 15,),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ]
//       ),
//     );
//   }
// }
