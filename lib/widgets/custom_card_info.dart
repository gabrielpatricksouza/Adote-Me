import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardInfo extends StatelessWidget {

  final double height;
  final double width;
  final String text;
  final Color colorIcon;
  final Color color;
  final IconData icon;
  final double sizeIcon;
  final int number;

  const CustomCardInfo({
      this.height = 200,
      this.width  = 200,
      this.number = 0,
      this.sizeIcon = 55,
      this.color = Colors.transparent,
      required this.colorIcon,
      required this.text,
      required this.icon,
    });

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        color: color,
        child: Container(
          height: height,
          width: width,
          child: Row(
            children: [
              // if(MediaQuery.of(context).size.width > 1000)
              Expanded(
                  child: Icon(icon, size: sizeIcon, color: colorIcon,)
              ),

              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          flex: 2,
                          child: Text(
                            text.toUpperCase(),
                            style: GoogleFonts.openSans(
                                fontSize: 16,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                          )
                      ),
                      Flexible(
                        flex: 1,
                        child: Text(
                          "R\$ " + number.toString(),
                          style: GoogleFonts.openSans(
                              fontSize: MediaQuery.of(context).size.width >= 1465 ? 25 : 20,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
