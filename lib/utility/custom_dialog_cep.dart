import 'package:adote_me/widgets/custom_animated_button.dart';
import 'package:flutter/material.dart';

class CustomDialogCep extends StatelessWidget {
  final String cidade;
  final String bairro;
  final String rua;

  const CustomDialogCep(
      {Key? key,
        required this.cidade,
        required this.bairro,
        required this.rua
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xffd7ecec),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Material(
                  borderRadius: BorderRadius.circular(25),
                  elevation: 15.0,
                  color: Colors.white,
                  shadowColor: Colors.grey[300],
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: cidade,
                      hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                    ),
                    enabled: false,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              //nome bairro
              Padding(
                padding: EdgeInsets.all(16),
                child: Material(
                  borderRadius: BorderRadius.circular(25),
                  elevation: 15.0,
                  color: Colors.white,
                  shadowColor: Colors.grey[300],
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: bairro,
                      hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                    ),
                    enabled: false,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              //nome da rua
              Padding(
                padding: EdgeInsets.all(16),
                child: Material(
                  borderRadius: BorderRadius.circular(25),
                  elevation: 15.0,
                  color: Colors.white,
                  shadowColor: Colors.grey[300],
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: rua,
                      hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                    ),
                    enabled: false,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomAnimatedButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  widhtMultiply: 1,
                  height: 60,
                  text: "Voltar",
                  color: Color(0xff198d97),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
