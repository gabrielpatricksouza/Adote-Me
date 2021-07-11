import 'package:adote_me/constants/constantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomSwitch extends StatefulWidget {
  final String text;
  final Function function;
  final bool isChecked;

  CustomSwitch({
    required this.text,
    required this.function,
    required this.isChecked,
  });

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {

  Duration _duration = Duration(milliseconds: 370);
  AnimationController? animationController;
  Animation<Alignment>? animation;

  @override
  void initState() {
   animationController = AnimationController(vsync: this, duration: _duration);
    animation = AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
          CurvedAnimation(
              parent: animationController!,
              curve: Curves.bounceOut,
              reverseCurve: Curves.bounceIn),
        );

   super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(25),
      elevation: 5.0,
      shadowColor: Colors.grey[350],
      child: Container(
        height: 65,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          border: Border.all(color: Colors.white,width: 1.1)
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
                animation: animationController!,
                builder: (context, child) {
                  return Center(
                    child: Container(
                      width: 60,
                      height: 30,
                      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                      decoration: BoxDecoration(
                        color: widget.isChecked ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: animation!.value,
                            child: GestureDetector(
                              onTap: () {
                                if (animationController!
                                    .isCompleted){

                                  animationController!.reverse();
                                } else {
                                  animationController!.forward();
                                }

                                widget.function(widget.isChecked);
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}