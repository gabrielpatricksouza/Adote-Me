import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritosDB{
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth  _auth = FirebaseAuth.instance;

  Future<List<QueryDocumentSnapshot>> dadosAnimais() async {
    String userId = _auth.currentUser!.uid;

    List<QueryDocumentSnapshot> listaAnimais  = [];
    List<String> listaAnimaisFavoritados  = [];

    DocumentSnapshot<Map<String, dynamic>> snapshotFavoritos =
            await _db.collection("usuarios").doc(userId).get();

    QuerySnapshot<Map<String, dynamic>> snapshot =
            await _db.collection("doacao").get();


    for( var dados in snapshotFavoritos.data()!['favoritos']){
      listaAnimaisFavoritados.add(dados);
    }

    for( var dados in snapshot.docs){
      if(listaAnimaisFavoritados.contains(dados.id)){
        listaAnimais.add(dados);
      }
    }


    return listaAnimais;
  }

  Future deletarFavorito(String idPet) async {
    String userId = _auth.currentUser!.uid;

    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("usuarios").doc(userId).get();

    try{
      List listaPet = snapshot.data()!['favoritos'];
      listaPet.remove(idPet);

      await _db.collection("usuarios").doc(userId).update({
        'favoritos':  listaPet
      });

      return true;

    }catch (e){
      return false;
    }
  }
}