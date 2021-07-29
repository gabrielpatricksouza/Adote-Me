import 'package:flutter/material.dart';
import 'package:adote_me/app/modules/doacao/view/doacao_page.dart';
import 'package:adote_me/app/modules/favoritos/view/favoritos_page.dart';
import 'package:adote_me/app/modules/home/view/home_page.dart';
import 'package:adote_me/app/modules/parceiros/view/parceiros_page.dart';
import 'package:adote_me/app/modules/sobre/view/sobre_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/* Cores */
Color primaryColor = Color(0xff1F1F30);
Color primaryGreen = Color(0xff416d6d);

/* Listas */
List<Widget> pages = [
  HomePage(),
  DoacaoPage(),
  FavoritosPage(),
  ParceirosPage(),
  SobrePage(),
];

List<String> namePages = [
  "Scaffold",
  "Sobre",
  "Explorar",
  "Serviços",
  "Portfólio",
  "Contato"
];

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey, blurRadius: 30, offset: Offset(0, 10))
];

List<Map> screenItems=[
  {
    'icon': FontAwesomeIcons.dog,
    'title' : 'Tipo: ',

    'icon2': FontAwesomeIcons.venusMars,
    'title2' : 'Sexo: ',
  },

  {
    'icon': FontAwesomeIcons.dna,
    'title' : 'Raça: ',

    'icon2': FontAwesomeIcons.rulerCombined,
    'title2' : 'Porte: ',
  },

  {
    'icon': FontAwesomeIcons.syringe,
    'title' : 'Vacinado: ',

    'icon2': FontAwesomeIcons.stethoscope,
    'title2' : 'Castrado: ',
  },

  {
    'icon': FontAwesomeIcons.microchip,
    'title' : 'Chipado: ',

    'icon2': FontAwesomeIcons.prescriptionBottleAlt,
    'title2' : 'Vermifugado: ',
  },
];