// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pets_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PetsStore on _PetsStore, Store {
  final _$listaAnimaisAtom = Atom(name: '_PetsStore.listaAnimais');

  @override
  ObservableList<Animal> get listaAnimais {
    _$listaAnimaisAtom.reportRead();
    return super.listaAnimais;
  }

  @override
  set listaAnimais(ObservableList<Animal> value) {
    _$listaAnimaisAtom.reportWrite(value, super.listaAnimais, () {
      super.listaAnimais = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_PetsStore.carregando');

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

  final _$buscarAnimaisAsyncAction = AsyncAction('_PetsStore.buscarAnimais');

  @override
  Future buscarAnimais() {
    return _$buscarAnimaisAsyncAction.run(() => super.buscarAnimais());
  }

  @override
  String toString() {
    return '''
listaAnimais: ${listaAnimais},
carregando: ${carregando}
    ''';
  }
}
