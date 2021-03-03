import 'package:adote_me/Controller/C_Donation/controller_donation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomChangeChoice extends StatefulWidget {

  final Function function;
  CustomChangeChoice({this.function});

  @override
  _CustomChangeChoiceState createState() => _CustomChangeChoiceState();
}

class _CustomChangeChoiceState extends State<CustomChangeChoice> {
  final _controllerDonation = ControllerDonation();

  @override
  Widget build(BuildContext context) {
    return  Observer(
      builder:(_) => Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 5.0,
        shadowColor: Colors.grey[350],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _controllerDonation.donationStore.changeValueSex(0);
                  widget.function(0);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: _controllerDonation.donationStore.valueSex == 0
                          ? Color(0xff00a4ad) : Colors.transparent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25)
                      )
                  ),
                  height: 60,
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.mars,
                        color: _controllerDonation.donationStore.valueSex == 0
                            ? Colors.white
                            : Colors.black
                      ),
                      SizedBox(width: 10,),

                      Text("Macho",
                        style: TextStyle(
                          fontSize: 18,
                          color: _controllerDonation.donationStore.valueSex == 0
                              ? Colors.white
                              : Colors.black
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              child: GestureDetector(
                onTap: () {
                   _controllerDonation.donationStore.changeValueSex(1);
                   widget.function(1);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: _controllerDonation.donationStore.valueSex == 1 ? Color(0xff00a4ad) : Colors.transparent,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25)
                      )
                  ),
                  height: 60,
                  width: 100,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                          FontAwesomeIcons.venus,
                          color: _controllerDonation.donationStore.valueSex == 1
                              ? Colors.white
                              : Colors.black
                      ),
                      SizedBox(width: 10,),

                      Text("Fêmea",
                        style: TextStyle(
                          fontSize: 18,
                          color: _controllerDonation.donationStore.valueSex == 1
                              ? Colors.white
                              : Colors.black
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
