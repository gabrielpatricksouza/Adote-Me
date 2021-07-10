import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonMenu extends StatelessWidget {

  final Function function;
  final String text;
  final Color textIconColor;
  final IconData icon;
  final Color backgroundColor;

  const CustomButtonMenu({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.textIconColor,
    @required this.backgroundColor,
    @required this.function
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function,
        style:  ButtonStyle(
            overlayColor:  MaterialStateProperty.resolveWith(
                    (states) => Colors.transparent),
          backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => backgroundColor),
          shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
              )
          )

        ),
        child: Container(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10.0,),
              Icon(
                icon,
                color: textIconColor,
              ),
              SizedBox(width: 10.0,),
              // Text(
              //   text,
              //   style: GoogleFonts.openSans(
              //       color: textIconColor, fontSize: 20
              //   ),
              // ),
            ],
          ),
        )
    );
  }
}
