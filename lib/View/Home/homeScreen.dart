import 'package:adote_me/Controller/C_Home/controller_home.dart';
import 'package:adote_me/View/Home/screenDetails.dart';
import 'package:adote_me/View/Utilits/CustomCard.dart';
import 'package:adote_me/bloc/Navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatelessWidget with NavigationStates {
  final Function onMenuTap;

  HomeScreen({Key key, this.onMenuTap}) : super(key: key);

  final _controllerHome = ControllerHome();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) =>  AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(
                  _controllerHome.homeStore.isDrawerOpen ? 20 : 0)
          ),
          color: Color(0xffd7ecec),
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _controllerHome.homeStore.isDrawerOpen
                          ? IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: (){
                          onMenuTap();
                          _controllerHome.homeStore.menuOff();
                        },
                      )
                          : IconButton(
                          icon: Icon(Icons.menu, size: 30,),
                          onPressed: (){
                            onMenuTap();
                            _controllerHome.homeStore.menuOn();
                          }
                      ),
                      Image.asset("assets/images/logoSmall.png", width: 80,),

                      IconButton(
                          icon: Icon(Icons.search, size: 30,),
                          onPressed: (){}
                          )
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
        ),
      ),
    );
  }
}
