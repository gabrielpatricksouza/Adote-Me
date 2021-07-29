import 'package:adote_me/app/model/Animal.dart';
import 'package:adote_me/app/modules/favoritos/services/favoritos_db.dart';
import 'package:adote_me/utility/simple_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
part 'favoritos_store.g.dart';

class FavoritosStore = _FavoritosStore with _$FavoritosStore;

abstract class _FavoritosStore with Store{
  FavoritosDB _acessoFavoritosDB = FavoritosDB();

  @observable
  ObservableList<Animal> listaAnimaisFavoritados = ObservableList<Animal>();

  @observable
  bool carregando = false;

  @action
  buscarAnimais() async {
    carregando = true;

    Animal animal = Animal();
    List<QueryDocumentSnapshot> lista = [];

    lista = await _acessoFavoritosDB.dadosAnimais();
    for(var dados in lista){
      animal = Animal.fromMap(dados.data() as Map);
      listaAnimaisFavoritados.add(animal);
    }
    carregando = false;
  }

  @action
  desfavoritarPet(context, String idPet, String nomePet) async {
    carregando = true;
    bool response = await _acessoFavoritosDB.deletarFirebase(idPet);
    carregando = false;
    if(response == true){
      simpleCustomAlert(
          context,
          AlertType.success,
          "",
          "$nomePet será retirado da sua lista de favoritos!"
      );

    }else{
      simpleCustomAlert(
          context,
          AlertType.info,
          "",
          "Ocorreu algum erro! Tente novamente mais tarde"
      );
    }
  }
}
