import 'package:adote_me/constants/constantes.dart';
import 'package:flutter/material.dart';

class CustomButtonMenu extends StatelessWidget {

  final Function function;
  final String text;
  final Color textIconColor;
  final IconData icon;
  final Color backgroundColor;
  final int seletedIndex;
  final int index;

  const CustomButtonMenu({

    required this.icon,
    required this.text,
    required this.textIconColor,
    required this.backgroundColor,
    required this.function,
    required this.index,
    required this.seletedIndex
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: InkWell(
        onTap: (){
          function();
        },
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
                  size: 28,
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
      ),
    );
  }
}
