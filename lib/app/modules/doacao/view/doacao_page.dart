import 'package:adote_me/app/modules/doacao/store/doacao_store.dart';
import 'package:adote_me/utility/custom_change_choice.dart';
import 'package:adote_me/utility/custom_swith.dart';
import 'package:adote_me/utility/cutom_select_image.dart';
import 'package:adote_me/widgets/InputCustomizado.dart';
import 'package:adote_me/widgets/custom_animated_button.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DoacaoPage extends StatefulWidget {
  @override
  _DoacaoPageState createState() => _DoacaoPageState();
}

class _DoacaoPageState extends ModularState<DoacaoPage, DoacaoStore> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xffd7ecec), //Color(0xff161621),
        body: Observer(
          builder: (_) => Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: controller.carregando
                ? Center(
                    child: SpinKitFadingCube(
                    size: 45,
                    color: Color(0xff198d97),
                  ))
                : NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowGlow();
                      return true; // or false
                    },
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Observer(
                              builder: (_) => CustomSelectImage(
                                listaImagens: controller.listaImagens,
                                imagemGaleria: () {
                                  controller
                                      .selecionarImagemGaleria()
                                      .whenComplete(() => setState(() {}));
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            InputCustomizado(
                              icon: Icons.pets,
                              hintText: "Nome do Pet",
                              hintStyle: TextStyle(color: Colors.grey),
                              fillColor: Colors.white, //Color(0xffd7ecec)
                              shadowColor: Colors.grey[350],
                              enableColor: Colors.white,
                              keyboardType: TextInputType.text,
                              controller: controller.nomePetController,
                            ),
                            SizedBox(height: 20),

                            InputCustomizado(
                              icon: Icons.phone_android,
                              hintText: "Whatsapp",
                              hintStyle: TextStyle(color: Colors.grey),
                              fillColor: Colors.white, //Color(0xffd7ecec)
                              shadowColor: Colors.grey[350],
                              enableColor: Colors.white,
                              keyboardType: TextInputType.phone,
                              controller: controller.wppPetController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter(),
                              ],
                            ),
                            SizedBox(height: 20),

                            InputCustomizado(
                              icon: Icons.explore_outlined,
                              hintText: "CEP",
                              hintStyle: TextStyle(color: Colors.grey),
                              fillColor: Colors.white, //Color(0xffd7ecec)
                              shadowColor: Colors.grey[350],
                              enableColor: Colors.white,
                              keyboardType: TextInputType.number,
                              controller: controller.cepPetController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CepInputFormatter(),
                              ],
                              onChanged: (String text){
                                controller.buscarCep(text, context);
                              },
                            ),
                            SizedBox(height: 20),

                            Observer(
                              builder: (_) => CustomChangeChoice(
                                function: (int num) {
                                  FocusScope.of(context).unfocus();
                                  controller.mudarValorSexo(num);
                                },
                                valueSex: controller.valueSex,
                              ),
                            ),
                            SizedBox(height: 20),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      "Porte do pet :",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20),
                                    elevation: 5.0,
                                    shadowColor: Colors.grey[350],
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 20),
                                      child: Observer(
                                        builder: (_) => DropdownButton(
                                          dropdownColor: Colors.white,
                                          focusColor: Colors.white,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                          value: controller.portePet,
                                          items: [
                                            DropdownMenuItem(
                                                child: Text("Pequeno"),
                                                value: "Pequeno"),
                                            DropdownMenuItem(
                                                child: Text("Médio"),
                                                value: "Médio"),
                                            DropdownMenuItem(
                                                child: Text("Grande"),
                                                value: "Grande"),
                                          ],
                                          onChanged: (val) {
                                            FocusScope.of(context).unfocus();
                                            controller
                                                .mudarPortePet(val.toString());
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      "Espécie do pet :",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20),
                                    elevation: 5.0,
                                    shadowColor: Colors.grey[350],
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 20),
                                      child: Observer(
                                        builder: (_) => DropdownButton(
                                          dropdownColor: Colors.white,
                                          focusColor: Colors.white,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            // backgroundColor: Colors.white,
                                          ),
                                          value: controller.especiePet,
                                          items: [
                                            DropdownMenuItem(
                                                child: Text("Cachorro"),
                                                value: "Cachorro"),
                                            DropdownMenuItem(
                                                child: Text("Gato"),
                                                value: "Gato"),
                                            DropdownMenuItem(
                                                child: Text("Roedor"),
                                                value: "Roedor"),
                                            DropdownMenuItem(
                                                child: Text("Passaro"),
                                                value: "Passaro"),
                                            DropdownMenuItem(
                                                child: Text("Outro"),
                                                value: "Outro"),
                                          ],
                                          onChanged: (val) {
                                            FocusScope.of(context).unfocus();
                                            controller
                                                .mudarEspeciePet(val.toString());
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Observer(
                              builder: (_) => CustomSwitch(
                                text: "Vacinado",
                                function: (bool check) {
                                  FocusScope.of(context).unfocus();
                                  controller.selecionarVacinado();
                                },
                                isChecked: controller.vacinado,
                              ),
                            ),
                            SizedBox(height: 20),
                            Observer(
                              builder: (_) => CustomSwitch(
                                text: "Castrado",
                                function: (bool check) {
                                  FocusScope.of(context).unfocus();
                                  controller.selecionarCadastrado();
                                },
                                isChecked: controller.cadastrado,
                              ),
                            ),
                            SizedBox(height: 20),
                            Observer(
                              builder: (_) => CustomSwitch(
                                text: "Chipado",
                                function: (bool check) {
                                  FocusScope.of(context).unfocus();
                                  controller.selecionarChipado();
                                },
                                isChecked: controller.chipado,
                              ),
                            ),
                            SizedBox(height: 20),
                            Observer(
                              builder: (_) => CustomSwitch(
                                text: "Vermifugado",
                                function: (bool check) {
                                  FocusScope.of(context).unfocus();
                                  controller.selecionarVermifugado();
                                },
                                isChecked: controller.vermifugado,
                              ),
                            ),
                            SizedBox(height: 20),
                            CustomAnimatedButton(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                controller.enviarParaDoacao(context);
                              },
                              widhtMultiply: 1,
                              height: 60,
                              text: "Enviar",
                              color: Color(0xff198d97),
                            ),
                            SizedBox(height: 20)
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
