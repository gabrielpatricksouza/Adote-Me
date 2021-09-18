import 'package:adote_me/app/model/Ocorrencia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DenunciaFirebase{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future cadastrarDadosPet(Denuncia denuncia) async {
    User user = _auth.currentUser!;
    denuncia.idDenunciante = user.uid;
    denuncia.idDenuncia  = db.collection("denuncia").doc().id;

    await db.collection("denuncia").doc(denuncia.idDenuncia).set(denuncia.toMap());
  }
}