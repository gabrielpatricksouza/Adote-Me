import 'package:adote_me/app/app_controller.dart';
import 'package:adote_me/app/model/Animal.dart';
import 'package:adote_me/app/modules/pets/services/pets_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'pets_store.g.dart';

class PetsStore = _PetsStore with _$PetsStore;

abstract class _PetsStore with Store{
  PetsDB _acessoPetsDB = PetsDB();
  AppController appController = Modular.get();

  @observable
  ObservableList<Animal> listaAnimais = ObservableList<Animal>();

  @observable
  bool carregando = false;

  @action
  buscarAnimais() async {
    carregando = true;
    Animal animal = Animal();
    List<QueryDocumentSnapshot> lista = [];

    lista = await _acessoPetsDB.dadosAnimais();

    for(var dados in lista){
      animal = Animal.fromMap(dados.data() as Map);
      if(animal.idDono == appController.usuario.idUsuario){
        listaAnimais.add(animal);
      }
    }
    carregando = false;
  }

  deletarPet(String idPet) async {
    await _acessoPetsDB.deletarAnimal(idPet);
    listaAnimais.clear();
    buscarAnimais();
  }
}
