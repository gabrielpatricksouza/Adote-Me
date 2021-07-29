import 'package:adote_me/app/modules/home/store/home_store.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  final HomeStore homeStore;
  const FilterScreen({Key? key, required this.homeStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        content: Container(
          width: MediaQuery.of(context).size.width,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
              return true; // or false
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        disabledColor: Colors.transparent,
                        icon: Icon(
                          Icons.close,
                          color: Color(0xff0c6a6a),
                        ),
                        onPressed: () {Navigator.of(context).pop();}
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GestureDetector(
                          onTap: (){
                            homeStore.filtrarPets("tipo", "Cachorro");
                            Navigator.pop(context);
                          },
                          child: Card(
                            color: Color(0xff0c6a6a),
                            shadowColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(28.0),)),
                            child: Container(
                              height: 60,
                                child: Center(child: Text("Cachorro", style: TextStyle(fontSize: 25),))
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0,),

                        GestureDetector(
                          onTap: (){
                            homeStore.filtrarPets("tipo", "Gato");
                            Navigator.pop(context);
                          },
                          child: Card(
                            color: Color(0xff0c6a6a),
                            shadowColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(28.0),)),
                            child: Container(
                                height: 60,
                                child: Center(child: Text("Roedor", style: TextStyle(fontSize: 25),))
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0,),

                        GestureDetector(
                          onTap: (){
                            homeStore.filtrarPets("tipo", "Roedor");
                            Navigator.pop(context);
                          },
                          child: Card(
                            color: Color(0xff0c6a6a),
                            shadowColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(28.0),)),
                            child: Container(
                                height: 60,
                                child: Center(child: Text("Gato", style: TextStyle(fontSize: 25),))
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0,),

                        GestureDetector(
                          onTap: (){
                            homeStore.filtrarPets("tipo", "Passaro");
                            Navigator.pop(context);
                          },
                          child: Card(
                            color: Color(0xff0c6a6a),
                            shadowColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(28.0),)),
                            child: Container(
                                height: 60,
                                child: Center(child: Text("Passaro", style: TextStyle(fontSize: 25),))
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0,),

                        GestureDetector(
                          onTap: (){
                            homeStore.filtrarPets("tipo", "Outro");
                            Navigator.pop(context);
                          },
                          child: Card(
                            color: Color(0xff0c6a6a),
                            shadowColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(28.0),)),
                            child: Container(
                                height: 60,
                                child: Center(child: Text("Outro", style: TextStyle(fontSize: 25),))
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
