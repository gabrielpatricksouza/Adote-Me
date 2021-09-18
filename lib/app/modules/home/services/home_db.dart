import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeDB{
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth  _auth = FirebaseAuth.instance;

  Future<List<QueryDocumentSnapshot>> dadosAnimais() async {
    List<QueryDocumentSnapshot> listaAnimais  = [];

    QuerySnapshot<Map<String, dynamic>> snapshot = await _db.collection("doacao").get();

    for( var dados in snapshot.docs){
      listaAnimais.add(dados);
    }

    return listaAnimais;
  }

  Future favoritarFirebase(String idPet) async {
    String userId = _auth.currentUser!.uid;
    bool petFavoritado = false;

    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("usuarios").doc(userId).get();

    if(snapshot.data()!['favoritos'] != null){
      for (var dados in snapshot.data()!['favoritos']) {
        if (dados == idPet) {
          petFavoritado = true;
        }
      }

      if(petFavoritado) return false;
      else {
        List listaPet = snapshot.data()!['favoritos'];
        listaPet.add(idPet);

        await _db.collection("usuarios").doc(userId).update({
          'favoritos':  listaPet
        });

        return true;
      }

    }else{
      List listaPet = [];
      listaPet.add(idPet);

      await _db.collection("usuarios").doc(userId).update({
        'favoritos':  listaPet
      });

      return true;
    }

  }

  bool checkCurrentUser() {
    User? user = _auth.currentUser;
    print(user!= null );
    return user != null ? true: false;
  }
}