import 'package:flutter/material.dart';

class IconOrImage extends StatelessWidget {
  final IconData icon;
  final String text;
  final String foto;


  IconOrImage({this.icon, this.text, this.foto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(children: [
        icon != null
         ? Padding(
           padding: const EdgeInsets.symmetric(horizontal: 8),
           child: Icon(
              icon,
            size: 35,
            color: Colors.white,
        ),
         )
         : CircleAvatar(
          backgroundColor: Color(0xffd7ecec),
          radius: 25,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                  foto == ""
                      ?'https://firebasestorage.googleapis.com/v0/b/adote-me-2ab97.appspot.com/o/perfil%2FlogoSmall.png?alt=media&token=9b551503-6e2e-4a69-afae-65cb71bbb43d'
                      : foto,
                  fit: BoxFit.contain,
                  loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(

                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff416d6d)),
                        backgroundColor: Color(0xff5C9999),
                        value: loadingProgress.expectedTotalBytes != null ?
                        loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  }
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20))
      ]
      ),
    );
  }
}
