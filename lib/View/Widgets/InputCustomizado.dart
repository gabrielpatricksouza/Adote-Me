import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputCustomizado extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final String hintText;
  final String labelText;
  final String prefix;
  final String suffix;
  final TextInputType keyboardType;
  final TextStyle labelStyle;
  final TextStyle hintStyle;
  final TextStyle suffixStyle;
  final bool obscure;
  final bool autofocus;
  final IconData icon;
  final IconData iconSuffix;
  final List<TextInputFormatter> inputFormatters;
  final Function(String) validator;
  final Function(String) onSaved;
  final Function(String) onChanged;

  InputCustomizado({
    this.controller,
    this.hint,
    this.hintText,
    this.obscure = false,
    this.autofocus = false,
    this.inputFormatters,
    this.validator,
    this.hintStyle,
    this.suffixStyle,
    this.labelStyle,
    this.onSaved,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.labelText,
    this.icon,
    this.iconSuffix,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      obscureText: this.obscure,
      autofocus: this.autofocus,
      inputFormatters: this.inputFormatters,
      validator: this.validator,
      onSaved: this.onSaved,
      onChanged: this.onChanged,
      keyboardType: this.keyboardType,
      style: TextStyle(fontSize: 20),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          prefixIcon: Icon(this.icon),
          suffixIcon: Icon(this.iconSuffix),
          contentPadding: EdgeInsets.fromLTRB(32, 18, 32, 18),
          labelStyle: this.labelStyle,
          labelText: this.labelText,
          hintStyle: this.hintStyle,
          hintText: this.hintText,
          prefixText: this.prefix,
          suffixText: this.suffix,
          suffixStyle: this.suffixStyle,
          filled: true,
          fillColor: Color(0xffCAE0E0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
          ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 1,color: Color(0xff1a1919),),
        ),
      ),
      cursorColor: Theme.of(context).primaryColor,
    );
  }
}
