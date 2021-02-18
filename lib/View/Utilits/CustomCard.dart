import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String foto;

  CustomCard({this.foto,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Stack(
                children: [
                  Hero(
                    tag: 1,
                    child:ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                            foto,
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
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 60, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text("Nome do Pet",
                          style:TextStyle(
                              color: Color(0xff416d6d),
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        textAlign:TextAlign.center,
                      ),
                    ),

                    Text("Cidade/Estado",
                      style:TextStyle(
                          color: Color(0xff5C9999),
                          fontSize: 18,
                          fontWeight: FontWeight.normal
                      ),
                      textAlign:TextAlign.center,
                    ),


                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              icon: Icon(Icons.favorite_border),
                              onPressed: (){}
                              ),

                          IconButton(
                              icon: Icon(Icons.share_outlined),
                              onPressed: (){}
                              ),
                        ],
                      )
                    ),

                  ],
                ),
            )
          )
        ],
      ),
    );
  }
}
