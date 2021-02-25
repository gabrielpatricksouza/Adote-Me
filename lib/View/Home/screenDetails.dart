import 'package:adote_me/View/Widgets/CustomAnimatedButton.dart';
import 'package:adote_me/View/Widgets/CustomIcontext.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'configuration.dart';

class ScreenDetails extends StatefulWidget {
  @override
  _ScreenDetailsState createState() => _ScreenDetailsState();
}

class _ScreenDetailsState extends State<ScreenDetails> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child:  Image.network(
                          'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg',
                          fit: BoxFit.cover,
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70, bottom: 125),
                      child: Container(
                        width: MediaQuery.of(context).size.width,

                        child: NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (overscroll) {
                            overscroll.disallowGlow();
                            return;
                          },
                          child: PageView.builder(
                            controller: pageController,
                            itemBuilder: (context, index) {
                              return CardPageWidget(
                                index,
                                pageOffset - index,
                              );
                            },
                            itemCount: screenItems.length,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
          ),

          Container(
            margin: EdgeInsets.only(top: 30),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  IconButton(icon: Icon(Icons.share), onPressed: () {})
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Container(
              height: 80,
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: shadowList,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: Text("Nome do Pet",
                  style:TextStyle(
                      color: Color(0xff416d6d),
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign:TextAlign.center,
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
                  CustomAnimatedButton(
                    icon: Icons.favorite_border,
                    widhtMultiply: 0.2,
                    height: 60,
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: CustomAnimatedButton(
                      text: "Adotar",
                      widhtMultiply: 1,
                      height: 60,
                    )
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
              ),
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

  CardPageWidget(this.index ,this.offset);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: GestureDetector(
        onTap: (){},
        child: Card(
          color: Color(0xffC3D9D9),
          margin: EdgeInsets.only(left: 8, right: 8, bottom: 18),
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              CustomIconText(
                text: screenItems[index]["title"],
                icon: screenItems[index]["icon"],
              ),

              CustomIconText(
                text: screenItems[index]["title2"],
                icon: screenItems[index]["icon2"],
              ),
            ],
          ),
        ),
      ),
    );
  }
}