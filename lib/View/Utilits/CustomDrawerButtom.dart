import 'package:adote_me/View/Home/configuration.dart';
import 'package:flutter/material.dart';

class CustomDrawerButtom extends StatelessWidget {
  final String text;
  final IconData icon;
  final int seletedIndex;
  final int index;

  CustomDrawerButtom({
    @required this.text,
    @required this.icon,
    @required this.seletedIndex,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.48,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20)
          ),

          color: seletedIndex == index ? Colors.white: Colors.transparent,
        ),


        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              seletedIndex == index ? SizedBox(width: 15) : SizedBox(width: 0),

              Icon(
                icon,
                color: seletedIndex == index ? primaryGreen : Colors.white,
                size: 30,
              ),
              SizedBox(width: 15),
              Text(
                text,
                style: TextStyle(
                  color: seletedIndex == index ? primaryGreen : Colors.white,
                  fontSize: 22,
                  fontWeight: seletedIndex == index ? FontWeight.w800 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
