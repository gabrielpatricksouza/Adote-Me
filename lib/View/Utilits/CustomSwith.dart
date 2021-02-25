import 'package:adote_me/Controller/C_Donation/controller_donation.dart';
import 'package:adote_me/View/Home/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomSwitch extends StatefulWidget {
  final String text;
  final Function function;

  CustomSwitch({
    @required this.text,
    @required this.function,
  });

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {

  Duration _duration = Duration(milliseconds: 370);
  final _controllerDonation = ControllerDonation();

  @override
  void initState() {
    super.initState();
    _controllerDonation.donationStore.animationController =
        AnimationController(vsync: this, duration: _duration);
    _controllerDonation.donationStore.animation =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
          CurvedAnimation(
              parent: _controllerDonation.donationStore.animationController,
              curve: Curves.bounceOut,
              reverseCurve: Curves.bounceIn),
        );
  }

  @override
  void dispose() {
    _controllerDonation.donationStore.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: Color(0xff1a1919),width: 1.1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Text(widget.text,
              style: TextStyle(
                color: primaryGreen,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: AnimatedBuilder(
              animation: _controllerDonation.donationStore.animationController,
              builder: (context, child) {
                return Center(
                  child: Observer(
                    builder:(_) => Container(
                      width: 60,
                      height: 30,
                      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                      decoration: BoxDecoration(
                          color: _controllerDonation.donationStore.isChecked
                              ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: _controllerDonation.donationStore.animation.value,
                            child: GestureDetector(
                              onTap: () {
                                  if (_controllerDonation
                                        .donationStore.animationController
                                        .isCompleted){

                                    _controllerDonation.donationStore
                                        .animationController.reverse();
                                  } else {
                                    _controllerDonation.donationStore
                                        .animationController.forward();
                                  }
                                  _controllerDonation.donationStore.changeChecked();

                                  widget.function(_controllerDonation.donationStore.isChecked);
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}