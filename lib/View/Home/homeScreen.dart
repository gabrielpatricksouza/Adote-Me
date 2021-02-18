import 'package:adote_me/Store/home_store.dart';
import 'package:adote_me/View/Home/screenDetails.dart';
import 'package:adote_me/View/Utilits/CustomCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeStore = HomeStore();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AnimatedContainer(
        transform:
            Matrix4.translationValues(homeStore.xOffset, homeStore.yOffset, 0)
              ..scale(homeStore.scaleFactor)
              ..rotateY(homeStore.isDrawerOpen ? -0.5 : 0),
        duration: Duration(milliseconds: 250),
        decoration: BoxDecoration(
            color: Color(0xffd7ecec),
            borderRadius:
                BorderRadius.circular(homeStore.isDrawerOpen ? 40 : 0.0)),
        child: Column(
          children: [
            SizedBox(height: 35),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  homeStore.isDrawerOpen
                      ? IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: homeStore.menuOff,
                        )
                      : IconButton(
                          icon: Icon(Icons.menu), onPressed: homeStore.menuOn),
                  Image.asset("assets/images/logoSmall.png", width: 100,),

                  Icon(Icons.search)
                ],
              ),
            ),

            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowGlow();
                  return;
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
            ),
          ],
        ),
      );
    });
  }
}
