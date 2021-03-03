import 'package:adote_me/Animacoes/FadeAnimation.dart';
import 'package:adote_me/Controller/C_Donation/controller_donation.dart';
import 'package:adote_me/View/Home/configuration.dart';
import 'package:adote_me/View/Utilits/CustomChangeChoice.dart';
import 'package:adote_me/View/Utilits/CustomSwith.dart';
import 'package:adote_me/View/Utilits/CutomSelectImage.dart';
import 'package:adote_me/View/Widgets/InputCustomizado.dart';
import 'package:adote_me/bloc/Navigation/navigation_bloc.dart';
import 'package:custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DonationPage extends StatelessWidget with NavigationStates {
  final Function onMenuTap;
  DonationPage({Key key, this.onMenuTap}) : super(key: key);

  final _controllerDonation = ControllerDonation();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Observer(
        builder: (_) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(
                _controllerDonation.homeStore.isDrawerOpen ? 20 : 0)),
            color: Color(0xffd7ecec),
          ),
          padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _controllerDonation.homeStore.isDrawerOpen
                      ? IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            onMenuTap();
                            _controllerDonation.homeStore.menuOff();
                          },
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: 30,
                          ),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            onMenuTap();
                            _controllerDonation.homeStore.menuOn();
                          }),
                  Text("Doação",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                  Icon(Icons.help_outline, color: Colors.black, size: 30),
                ],
              ),
              Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return;
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                      children: [

                        Observer(
                          builder:(_) => _controllerDonation.donationStore
                              .firstValues == true
                              ? Container()
                              : Column(
                                children: [

                                  CustomSelectImage(
                                    listaImagens: _controllerDonation
                                        .donationStore.listaImagens,

                                    imagemGaleria: (){
                                      _controllerDonation.donationStore

                                          .selecionarImagemGaleria();
                                    },
                                  ),

                                  SizedBox(height: 20),

                                  FadeAnimation(
                                      0.2,
                                      InputCustomizado(
                                        icon: Icons.pets,
                                        hintText: "Nome do Pet",
                                        fillColor: Colors.white, //Color(0xffd7ecec)
                                        shadowColor: Colors.grey[350],
                                        enableColor: Colors.white,
                                        keyboardType: TextInputType.text,
                                        controller: _controllerDonation
                                            .donationStore.nomePetController,
                                        onChanged:
                                        _controllerDonation.donationStore.setNomePet,
                                      )),
                                  SizedBox(height: 20),
                                  FadeAnimation(
                                    0.4,
                                    CustomSwitch(
                                      text: "Pet possui raça ?",
                                      function: (bool check) {
                                        _controllerDonation.donationStore
                                            .changePetChecked();
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Observer(
                                      builder: (_) => _controllerDonation
                                          .donationStore.petChecked
                                          ? Padding(
                                        padding: const EdgeInsets.only(bottom: 20),
                                        child: InputCustomizado(
                                          icon: FontAwesomeIcons.dna,
                                          hintText: "Raça do Pet",
                                          fillColor: Colors.white,
                                          enableColor: Colors.white,
                                          keyboardType: TextInputType.text,
                                          shadowColor: Colors.grey[350],
                                          controller: _controllerDonation
                                              .donationStore.racaController,
                                          onChanged: _controllerDonation
                                              .donationStore.setNomePet,
                                        ),
                                      )
                                          : Container()),

                                  FadeAnimation(0.6,
                                      CustomChangeChoice(
                                        function: (int val){
                                          _controllerDonation.donationStore
                                              .changeValueSex(val);
                                        },
                                      )
                                  ),

                                  SizedBox(height: 20),
                                  FadeAnimation(
                                    0.8,
                                    Observer(
                                      builder: (_) => CustomDropdown(
                                        valueIndex: _controllerDonation
                                            .donationStore.checkboxValue,
                                        borderRadius: 25,
                                        enabledIconColor: primaryGreen,
                                        hint: "Tipo do pet",
                                        enableTextColor: primaryGreen,
                                        items: [
                                          CustomDropdownItem(text: "Cães"),
                                          CustomDropdownItem(text: "Gatos"),
                                          CustomDropdownItem(text: "Roedores"),
                                          CustomDropdownItem(text: "Passaros"),
                                          CustomDropdownItem(text: "Outros"),
                                        ],
                                        onChanged: (newValue) {
                                          _controllerDonation.donationStore
                                              .changeCheckBox(newValue);
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                        ),

                        Observer(builder: (_) =>
                          _controllerDonation.donationStore.firstValues != true

                              ? Container()
                              : Column(
                                children: [

                                  FadeAnimation(
                                    0.2, Padding(
                                      padding: const EdgeInsets.only(bottom: 25),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: IconButton(
                                            iconSize: 30,
                                            icon: Icon(Icons.arrow_back_ios_outlined),
                                            onPressed: (){
                                              _controllerDonation.donationStore.cleanVariables();
                                            }
                                            ),
                                      ),
                                    ),
                                  ),

                                  FadeAnimation(
                                   0.4,
                                    CustomSwitch(
                                      text: "Vacinado",
                                      function: (bool check) {
                                        _controllerDonation.donationStore
                                            .changeChecked();
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20),

                                  FadeAnimation(
                                    0.6,
                                    CustomSwitch(
                                      text: "Castrado",
                                      function: (bool check) {
                                        _controllerDonation.donationStore
                                            .changeChecked();
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20),

                                  FadeAnimation(
                                    0.8,
                                    CustomSwitch(
                                      text: "Chipado",
                                      function: (bool check) {
                                        _controllerDonation.donationStore
                                            .changeChecked();
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20),

                                  FadeAnimation(
                                    1,
                                    CustomSwitch(
                                      text: "Vermifugado",
                                      function: (bool check) {
                                        _controllerDonation.donationStore
                                            .changeChecked();
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
