// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favoritos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritosStore on _FavoritosStore, Store {
  final _$listaAnimaisFavoritadosAtom =
      Atom(name: '_FavoritosStore.listaAnimaisFavoritados');

  @override
  ObservableList<Animal> get listaAnimaisFavoritados {
    _$listaAnimaisFavoritadosAtom.reportRead();
    return super.listaAnimaisFavoritados;
  }

  @override
  set listaAnimaisFavoritados(ObservableList<Animal> value) {
    _$listaAnimaisFavoritadosAtom
        .reportWrite(value, super.listaAnimaisFavoritados, () {
      super.listaAnimaisFavoritados = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_FavoritosStore.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  final _$buscarAnimaisAsyncAction =
      AsyncAction('_FavoritosStore.buscarAnimais');

  @override
  Future buscarAnimais() {
    return _$buscarAnimaisAsyncAction.run(() => super.buscarAnimais());
  }

  final _$desfavoritarPetAsyncAction =
      AsyncAction('_FavoritosStore.desfavoritarPet');

  @override
  Future desfavoritarPet(dynamic context, String idPet, String nomePet) {
    return _$desfavoritarPetAsyncAction
        .run(() => super.desfavoritarPet(context, idPet, nomePet));
  }

  @override
  String toString() {
    return '''
listaAnimaisFavoritados: ${listaAnimaisFavoritados},
carregando: ${carregando}
    ''';
  }
}
