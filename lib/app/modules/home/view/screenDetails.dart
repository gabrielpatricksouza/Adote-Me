import 'package:adote_me/app/model/Animal.dart';
import 'package:adote_me/app/modules/home/store/home_store.dart';
import 'package:adote_me/constants/constantes.dart';
import 'package:adote_me/widgets/custom_animated_button.dart';
import 'package:adote_me/widgets/custom_icon_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ScreenDetails extends StatefulWidget {
  final String local;
  final Animal animal;
  final HomeStore? controller;

  const ScreenDetails({Key? key, required this.animal, this.controller, required this.local}) : super(key: key);
  @override
  _ScreenDetailsState createState() => _ScreenDetailsState();
}

class _ScreenDetailsState extends State<ScreenDetails> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      body: Stack(
        children: [
          Positioned.fill(
              child: Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: widget.animal.imagensPet![0].isEmpty
                  ? "https://bityli.com/1igZU"
                  : widget.animal.imagensPet![0],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => SpinKitFadingCircle(
                    color: Color(0xff198d97),
                    size: 40,
                  ),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70, bottom: 125),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowGlow();
                        return true;
                      },
                        child: PageView.builder(
                          controller: pageController,
                          itemBuilder: (context, index) {
                            return CardPageWidget(
                              index,
                              pageOffset - index,
                              widget.animal
                            );
                          },
                          itemCount: screenItems.length,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Color(0xff198d97),
                  iconSize: 35,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 80,
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Color(0xfff0f1f1),
                  boxShadow: shadowList,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  widget.animal.nomePet,
                  style: TextStyle(
                      color: Color(0xff416d6d),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 110,
              child: Row(
                children: [
                  if(widget.local == 'home')
                  ...[
                    CustomAnimatedButton(
                      onTap: (){
                        widget.controller!.favoritarPet(context, widget.animal.idPet);
                      },
                      icon: Icons.favorite_border,
                      iconBool: true,
                      widhtMultiply: 0.2,
                      height: 60,
                      color: primaryGreen,
                    ),
                    SizedBox(width: 10),
                  ],
                  Expanded(
                      child: CustomAnimatedButton(
                        onTap: () async {
                          widget.controller!.adotarPet(
                              context,
                              widget.animal.nomePet,
                              widget.animal.whatsapp
                          );
                        },
                        text: "Adotar",
                        widhtMultiply: 1,
                        height: 60,
                        color: primaryGreen,
                  ))
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class CardPageWidget extends StatelessWidget {
  final int index;
  final double offset;
  final Animal animal;

  CardPageWidget(this.index, this.offset, this.animal);

  String _valoresLinha1(int index){
    if(index == 0) return animal.especiePet;
    if(index == 1) return animal.cidade;
    if(index == 2) return animal.vacinadoPet ? "Sim" : "Não";
    if(index == 3) return animal.chipadoPet  ? "Sim" : "Não";
    return'';
  }

  String _valoresLinha2(int index){
    if(index == 0) return animal.sexoPet;
    if(index == 1) return animal.portePet;
    if(index == 2) return animal.castradoPet ? "Sim" : "Não";
    if(index == 3) return animal.vermifugadoPet  ? "Sim" : "Não";
    return'';
  }

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        color: Color(0xff7aa7a7),
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 18),
        elevation: 8,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomIconText(
              text: screenItems[index]["title"] + _valoresLinha1(index),
              icon: screenItems[index]["icon"],
            ),
            CustomIconText(
              text: screenItems[index]["title2"] + _valoresLinha2(index),
              icon: screenItems[index]["icon2"],
            ),
          ],
        ),
      ),
    );
  }
}
