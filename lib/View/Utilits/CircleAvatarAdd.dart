import 'package:flutter/material.dart';

class CircleAvatarAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(
        backgroundColor: Colors.grey[400],
        radius: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.add_a_photo, size: 40, color: Colors.grey[100],),
            Text("Adicionar", style: TextStyle(color: Colors.grey[100]),)
          ],
        ),
      ),
    );
  }
}
