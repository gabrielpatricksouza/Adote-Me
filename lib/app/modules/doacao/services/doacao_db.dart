import 'package:adote_me/app/model/Animal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DoacaoFirebase{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future cadastrarDadosPet(Animal animal) async {
    User user = _auth.currentUser!;
    CollectionReference resultID = db.collection("doacao");

    animal.idPet = resultID.doc().id;
    animal.idDono = user.uid;

    await db.collection("doacao").doc().set(animal.toMap());
  }
}