// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'denunciar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DenunciarStore on _DenunciarStoreBase, Store {
  final _$portePetAtom = Atom(name: '_DenunciarStoreBase.portePet');

  @override
  String? get tipoDenuncia {
    _$portePetAtom.reportRead();
    return super.tipoDenuncia;
  }

  @override
  set tipoDenuncia(String? value) {
    _$portePetAtom.reportWrite(value, super.tipoDenuncia, () {
      super.tipoDenuncia = value;
    });
  }

  final _$listaImagensAtom = Atom(name: '_DenunciarStoreBase.listaImagens');

  @override
  List<File> get listaImagens {
    _$listaImagensAtom.reportRead();
    return super.listaImagens;
  }

  @override
  set listaImagens(List<File> value) {
    _$listaImagensAtom.reportWrite(value, super.listaImagens, () {
      super.listaImagens = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_DenunciarStoreBase.carregando');

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

  final _$selecionarImagemGaleriaAsyncAction =
      AsyncAction('_DenunciarStoreBase.selecionarImagemGaleria');

  @override
  Future<dynamic> selecionarImagemGaleria() {
    return _$selecionarImagemGaleriaAsyncAction
        .run(() => super.selecionarImagemGaleria());
  }

  final _$_DenunciarStoreBaseActionController =
      ActionController(name: '_DenunciarStoreBase');

  @override
  dynamic mudarDenuncia(String valueBox) {
    final _$actionInfo = _$_DenunciarStoreBaseActionController.startAction(
        name: '_DenunciarStoreBase.mudarPortePet');
    try {
      return super.mudarDenuncia(valueBox);
    } finally {
      _$_DenunciarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
portePet: ${tipoDenuncia},
listaImagens: ${listaImagens},
carregando: ${carregando}
    ''';
  }
}
