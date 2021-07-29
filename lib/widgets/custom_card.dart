import 'package:adote_me/app/model/Animal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomCard extends StatelessWidget {
  final String foto;
  final Animal animal;
  final Function action;
  final IconData icon;
  final Color color;

  CustomCard({
    this.foto = "",
    required this.animal,
    required this.action,
    this.icon = Icons.favorite_border,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      child: AspectRatio(
                          aspectRatio: 1,
                          child: CachedNetworkImage(
                            imageUrl: foto.isEmpty
                                ? "https://bityli.com/1igZU"
                                : foto,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                SpinKitFadingCircle(
                              color: Color(0xff198d97),
                              size: 40,
                            ),
                            errorWidget: (context, url, error) =>
                                new Icon(Icons.error),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 60, bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    Flexible(
                      child: Text(
                        animal.nomePet.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xff416d6d),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        animal.cidade,
                        style: TextStyle(
                            color: Color(0xff5C9999),
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Flexible(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: Icon(icon),
                              color: color,
                              iconSize: 30,
                              onPressed: () {
                                action();
                              }),

                          // IconButton(
                          //     icon: Icon(Icons.share_outlined),
                          //     color: Colors.grey,
                          //     onPressed: (){}
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
