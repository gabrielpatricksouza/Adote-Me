import 'package:adote_me/app/app_controller.dart';
import 'package:adote_me/app/model/Animal.dart';
import 'package:adote_me/app/modules/home/services/home_db.dart';
import 'package:adote_me/utility/simple_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store{

  HomeDB _acessoHomeDB = HomeDB();
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

    lista = await _acessoHomeDB.dadosAnimais();

    for(var dados in lista){
      animal = Animal.fromMap(dados.data() as Map);
      listaAnimais.add(animal);
    }
    carregando = false;
  }


  List<Animal> lista = [];

  @action
  filtrarPets(String filtro, var valor)async{
    listaAnimais.clear();
    await buscarAnimais();

    if(filtro == 'tipo') _filtrarTipo(valor);
    if(filtro == 'sexo') _filtrarSexo(valor);
    if(filtro == 'porte') _filtrarPorte(valor);
    if(filtro == 'cidade') _filtrarCidade(valor);
    if(filtro == 'vacinado') _filtrarVacinado(valor);
    if(filtro == 'castrado') _filtrarCastrado(valor);
    if(filtro == 'chipado') _filtrarChipado(valor);
    if(filtro == 'vermifudo') _filtrarVermifugado(valor);
    if(filtro == 'limpar') _limparFiltro();


    listaAnimais.clear();
    for(var dados in lista){
      listaAnimais.add(dados);
    }
  }

  adotarPet(context, String nomePet, String numWpp)async {
    if(numWpp.isEmpty){
      simpleCustomAlert(
          context,
          AlertType.info,
          "",
          "Não foi inserido whatsapp para contato!"
      );

    }else{
      final link = WhatsAppUnilink(
        phoneNumber: "+55 " + numWpp.replaceAll("-",  ""),
        text: appController.usuario.nome.isEmpty
            ? "Olá! Venho do app Adote-me, e adoraria adotar o(a) $nomePet"
            : "Olá! Meu nome é ${appController.usuario.nome}. "
              "Venho do app Adote-me, e adoraria adotar o(a) $nomePet",
      );
      await launch('$link', forceWebView: false, forceSafariVC: false);
    }
  }

  favoritarPet(context, String idPet) async {
    carregando = true;
    if(_acessoHomeDB.checkCurrentUser() == false) {
      carregando = false;
      Modular.to.pushNamed("/login");

    } else{
      bool response = await _acessoHomeDB.favoritarFirebase(idPet);
      carregando = false;
      if(response == true){
        simpleCustomAlert(
            context,
            AlertType.success,
            "",
            "Pet favoritado com sucesso!"
        );
      }else{
        simpleCustomAlert(
            context,
            AlertType.info,
            "",
            "Este pet já foi favoritado!"
        );
      }
    }
  }
  _limparFiltro(){
    lista.clear();

    for(var dados in listaAnimais){
      lista.add(dados);
    }
  }

  _filtrarTipo(String valor){
    lista.clear();

    for(var dados in listaAnimais){
      if(dados.especiePet == valor){
        lista.add(dados);
      }
    }
  }

  _filtrarSexo(String valor){
    lista.clear();

    for(var dados in listaAnimais){
      if(dados.sexoPet == valor){
        lista.add(dados);
      }
    }
  }

  _filtrarPorte(String valor){
    lista.clear();

    for(var dados in listaAnimais){
      if(dados.portePet == valor){
        lista.add(dados);
      }
    }
  }

  _filtrarCidade(String valor){
    lista.clear();

    for(var dados in listaAnimais){
      if(dados.cidade.contains(valor)){
        lista.add(dados);
      }
    }
  }

  _filtrarVacinado(bool valor){
    lista.clear();

    for(var dados in listaAnimais){
      if(dados.vacinadoPet == valor){
        lista.add(dados);
      }
    }
  }

  _filtrarCastrado(bool valor){
    lista.clear();

    for(var dados in listaAnimais){
      if(dados.castradoPet == valor){
        lista.add(dados);
      }
    }
  }

  _filtrarChipado(bool valor){
    lista.clear();

    for(var dados in listaAnimais){
      if(dados.chipadoPet == valor){
        lista.add(dados);
      }
    }
  }

  _filtrarVermifugado(bool valor){
    lista.clear();

    for(var dados in listaAnimais){
      if(dados.vermifugadoPet == valor){
        lista.add(dados);
      }
    }
  }
}
