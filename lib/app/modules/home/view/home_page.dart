import 'package:adote_me/app/modules/home/store/home_store.dart';
import 'package:adote_me/app/modules/home/view/screenDetails.dart';
import 'package:adote_me/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(0xffd7ecec),//Color(0xff161621),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: ListView(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ScreenDetails()));
                  },
                  child: CustomCard(
                    foto:'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg',
                  )
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
    );
  }
}
