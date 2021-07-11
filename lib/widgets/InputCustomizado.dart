import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputCustomizado extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final String hintText;
  final String labelText;
  final String prefix;
  final String suffix;
  final Color fillColor;
  final Color enableColor;
  final Color? shadowColor;
  final TextInputType keyboardType;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? suffixStyle;
  final bool obscure;
  final bool autofocus;
  final IconData? icon;
  final GestureDetector? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  // final Function(String) validator;
  // final Function(String) onSaved;
  final Function(String) onChanged;

  InputCustomizado({
    required this.controller,
    this.hint        = "",
    this.fillColor   = Colors.transparent,
    this.shadowColor,
    this.enableColor = const Color(0xff1a1919),
    this.hintText    = "",
    this.obscure = false,
    this.autofocus = false,
    this.inputFormatters,
    // this.validator,
    this.hintStyle,
    this.suffixStyle,
    this.labelStyle,
    // this.onSaved,
    required this.onChanged,
    this.prefix      = "",
    this.suffix      = "",
    this.labelText   = "",
    this.icon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(25),
      elevation: 5.0,
      shadowColor:shadowColor, // Colors.grey[350]
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        autofocus: autofocus,
        inputFormatters:inputFormatters,
        // validator: validator,
        // onSaved: onSaved,
        onChanged: onChanged,
        keyboardType: keyboardType,
        style: TextStyle(fontSize: 20, color: Colors.grey[900]),
        textAlign: TextAlign.start,
        decoration: InputDecoration(

            prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(this.icon, color: Colors.grey[700],)
            ),
            suffixIcon: suffixIcon,
            contentPadding: suffixIcon == null
                ? EdgeInsets.fromLTRB(18, 18, 12, 18)
                : EdgeInsets.fromLTRB(0, 18, 0, 18),

            labelStyle: this.labelStyle,
            labelText: this.labelText,
            hintStyle: this.hintStyle,
            hintText: this.hintText,
            prefixText: this.prefix,
            suffixText: this.suffix,
            suffixStyle: this.suffixStyle,
            filled: true,
            fillColor: fillColor, //CAE0E0
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
            ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(width: 1.18,color: Color(0xff1a1919),),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(width: 1.2,color: enableColor), //Color(0xff1a1919)
          ),
        ),
        cursorColor: Colors.grey[700],
      ),
    );
  }
}
