import 'package:adote_me/Animacoes/FadeAnimation.dart';
import 'package:adote_me/Controller/C_Donation/controller_donation.dart';
import 'package:adote_me/View/Utilits/CustomChangeChoice.dart';
import 'package:adote_me/View/Utilits/CustomSwith.dart';
import 'package:adote_me/View/Widgets/InputCustomizado.dart';
import 'package:adote_me/bloc/Navigation/navigation_bloc.dart';
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
        builder: (_) =>  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(
                    _controllerDonation.homeStore.isDrawerOpen ? 20 : 0)
            ),
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
                    onPressed: (){
                      onMenuTap();
                      _controllerDonation.homeStore.menuOff();
                    },
                  )
                      : IconButton(
                      icon: Icon(Icons.menu, size: 30,),
                      onPressed: (){
                        FocusScope.of(context).unfocus();
                        onMenuTap();
                        _controllerDonation.homeStore.menuOn();
                      }
                  ),
                  Text("Doação",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      )
                  ),
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
                        FadeAnimation(0.2,
                            InputCustomizado(
                              icon: Icons.pets,
                              hintText: "Nome do Pet",
                              fillColor:  Colors.white,//Color(0xffd7ecec)
                              keyboardType: TextInputType.text,
                              controller: _controllerDonation.donationStore.nomePetController,
                              onChanged: _controllerDonation.donationStore.setNomePet,
                            )
                        ),
                        SizedBox(height: 20),

                        FadeAnimation(
                          0.4, CustomSwitch(
                            text: "Pet possui raça ?",
                            function: (bool check) {
                              _controllerDonation.donationStore.changePetChecked();
                            },
                          ),
                        ),
                        SizedBox(height: 20),

                        Observer(
                          builder:(_) =>  _controllerDonation
                                              .donationStore.petChecked
                              ? Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: InputCustomizado(
                                    icon: FontAwesomeIcons.dna,
                                    hintText: "Raça do Pet",
                                    fillColor: Colors.white,
                                    keyboardType: TextInputType.text,
                                    controller: _controllerDonation
                                          .donationStore.racaController,
                                    onChanged: _controllerDonation
                                          .donationStore.setNomePet,
                                ),
                              )
                              : Container()
                        ),

                        FadeAnimation(
                          0.6, CustomChangeChoice()
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