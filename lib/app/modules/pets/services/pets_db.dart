import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PetsDB{
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot>> dadosAnimais() async {
    List<QueryDocumentSnapshot> listaAnimais  = [];

    QuerySnapshot<Map<String, dynamic>> snapshot = await _db.collection("doacao").get();

    for( var dados in snapshot.docs){
      listaAnimais.add(dados);
    }

    return listaAnimais;
  }

  Future deletarAnimal(String idPet) async {
   try{
     await _db.collection("doacao").doc(idPet).delete();
   }catch(e){
     print(e);
   }
  }
}