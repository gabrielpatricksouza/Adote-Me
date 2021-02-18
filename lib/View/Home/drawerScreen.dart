import 'package:flutter/material.dart';
import 'configuration.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryGreen,
      padding: EdgeInsets.only(top:50,bottom: 70,left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          GestureDetector(
            onTap: ()=> Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false),
            child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 30,),
                  SizedBox(width: 20),
                  Text( 'Voltar',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                ]
            ),
          ),

          Column(
            children: drawerItems.map(
                    (element) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: ()=> Navigator.pushNamed(context, element['route']),
                child: Row(
                  children: [
                    Icon(element['icon'],color: Colors.white,size: 30,),
                    SizedBox(width: 20),
                    Text(element['title'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                  ],

                ),
              ),
            )).toList(),
          ),

          Row(
            children: [
              Icon(Icons.settings,color: Colors.white,),
              SizedBox(width: 10,),
              Text('Configurações',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Container(width: 2,height: 20,color: Colors.white,),
              SizedBox(width: 10,),
              Text('Sair',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)

            ],

          )


        ],
      ),

    );
  }
}
