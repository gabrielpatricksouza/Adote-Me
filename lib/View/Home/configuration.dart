import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryGreen = Color(0xff416d6d);
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
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