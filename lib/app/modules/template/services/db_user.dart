import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConexaoBDTemplate {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;


  Future deslogarUsuario() async {
    await  _auth.signOut();
  }


  bool checkCurrentUser() {
    User? user = _auth.currentUser;
    return user != null ? true : false;
  }

}
