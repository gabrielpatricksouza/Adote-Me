// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DoacaoStore on _DoacaoStore, Store {
  final _$nomePetAtom = Atom(name: '_DoacaoStore.nomePet');

  @override
  String get nomePet {
    _$nomePetAtom.reportRead();
    return super.nomePet;
  }

  @override
  set nomePet(String value) {
    _$nomePetAtom.reportWrite(value, super.nomePet, () {
      super.nomePet = value;
    });
  }

  final _$racaAtom = Atom(name: '_DoacaoStore.raca');

  @override
  String get raca {
    _$racaAtom.reportRead();
    return super.raca;
  }

  @override
  set raca(String value) {
    _$racaAtom.reportWrite(value, super.raca, () {
      super.raca = value;
    });
  }

  final _$animationAtom = Atom(name: '_DoacaoStore.animation');

  @override
  Animation<Alignment> get animation {
    _$animationAtom.reportRead();
    return super.animation;
  }

  @override
  set animation(Animation<Alignment> value) {
    _$animationAtom.reportWrite(value, super.animation, () {
      super.animation = value;
    });
  }

  final _$animationControllerAtom =
      Atom(name: '_DoacaoStore.animationController');

  @override
  AnimationController get animationController {
    _$animationControllerAtom.reportRead();
    return super.animationController;
  }

  @override
  set animationController(AnimationController value) {
    _$animationControllerAtom.reportWrite(value, super.animationController, () {
      super.animationController = value;
    });
  }

  final _$vacinadoAtom = Atom(name: '_DoacaoStore.vacinado');

  @override
  bool get vacinado {
    _$vacinadoAtom.reportRead();
    return super.vacinado;
  }

  @override
  set vacinado(bool value) {
    _$vacinadoAtom.reportWrite(value, super.vacinado, () {
      super.vacinado = value;
    });
  }

  final _$cadastradoAtom = Atom(name: '_DoacaoStore.cadastrado');

  @override
  bool get cadastrado {
    _$cadastradoAtom.reportRead();
    return super.cadastrado;
  }

  @override
  set cadastrado(bool value) {
    _$cadastradoAtom.reportWrite(value, super.cadastrado, () {
      super.cadastrado = value;
    });
  }

  final _$chipadoAtom = Atom(name: '_DoacaoStore.chipado');

  @override
  bool get chipado {
    _$chipadoAtom.reportRead();
    return super.chipado;
  }

  @override
  set chipado(bool value) {
    _$chipadoAtom.reportWrite(value, super.chipado, () {
      super.chipado = value;
    });
  }

  final _$vermifugadoAtom = Atom(name: '_DoacaoStore.vermifugado');

  @override
  bool get vermifugado {
    _$vermifugadoAtom.reportRead();
    return super.vermifugado;
  }

  @override
  set vermifugado(bool value) {
    _$vermifugadoAtom.reportWrite(value, super.vermifugado, () {
      super.vermifugado = value;
    });
  }

  final _$valueSexAtom = Atom(name: '_DoacaoStore.valueSex');

  @override
  int get valueSex {
    _$valueSexAtom.reportRead();
    return super.valueSex;
  }

  @override
  set valueSex(int value) {
    _$valueSexAtom.reportWrite(value, super.valueSex, () {
      super.valueSex = value;
    });
  }

  final _$checkboxValueAtom = Atom(name: '_DoacaoStore.checkboxValue');

  @override
  String? get checkboxValue {
    _$checkboxValueAtom.reportRead();
    return super.checkboxValue;
  }

  @override
  set checkboxValue(String? value) {
    _$checkboxValueAtom.reportWrite(value, super.checkboxValue, () {
      super.checkboxValue = value;
    });
  }

  final _$firstValuesAtom = Atom(name: '_DoacaoStore.firstValues');

  @override
  bool get firstValues {
    _$firstValuesAtom.reportRead();
    return super.firstValues;
  }

  @override
  set firstValues(bool value) {
    _$firstValuesAtom.reportWrite(value, super.firstValues, () {
      super.firstValues = value;
    });
  }

  final _$listaImagensAtom = Atom(name: '_DoacaoStore.listaImagens');

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

  final _$selecionarImagemGaleriaAsyncAction =
      AsyncAction('_DoacaoStore.selecionarImagemGaleria');

  @override
  Future selecionarImagemGaleria() {
    return _$selecionarImagemGaleriaAsyncAction
        .run(() => super.selecionarImagemGaleria());
  }

  final _$_DoacaoStoreActionController = ActionController(name: '_DoacaoStore');

  @override
  void setNomePet(String text) {
    final _$actionInfo = _$_DoacaoStoreActionController.startAction(
        name: '_DoacaoStore.setNomePet');
    try {
      return super.setNomePet(text);
    } finally {
      _$_DoacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRaca(String text) {
    final _$actionInfo = _$_DoacaoStoreActionController.startAction(
        name: '_DoacaoStore.setRaca');
    try {
      return super.setRaca(text);
    } finally {
      _$_DoacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selecionarVacinado() {
    final _$actionInfo = _$_DoacaoStoreActionController.startAction(
        name: '_DoacaoStore.selecionarVacinado');
    try {
      return super.selecionarVacinado();
    } finally {
      _$_DoacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selecionarCadastrado() {
    final _$actionInfo = _$_DoacaoStoreActionController.startAction(
        name: '_DoacaoStore.selecionarCadastrado');
    try {
      return super.selecionarCadastrado();
    } finally {
      _$_DoacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selecionarChipado() {
    final _$actionInfo = _$_DoacaoStoreActionController.startAction(
        name: '_DoacaoStore.selecionarChipado');
    try {
      return super.selecionarChipado();
    } finally {
      _$_DoacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selecionarVermifugado() {
    final _$actionInfo = _$_DoacaoStoreActionController.startAction(
        name: '_DoacaoStore.selecionarVermifugado');
    try {
      return super.selecionarVermifugado();
    } finally {
      _$_DoacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeValueSex(int value) {
    final _$actionInfo = _$_DoacaoStoreActionController.startAction(
        name: '_DoacaoStore.changeValueSex');
    try {
      return super.changeValueSex(value);
    } finally {
      _$_DoacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCheckBox(String valueBox) {
    final _$actionInfo = _$_DoacaoStoreActionController.startAction(
        name: '_DoacaoStore.changeCheckBox');
    try {
      return super.changeCheckBox(valueBox);
    } finally {
      _$_DoacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic mudarPagina() {
    final _$actionInfo = _$_DoacaoStoreActionController.startAction(
        name: '_DoacaoStore.mudarPagina');
    try {
      return super.mudarPagina();
    } finally {
      _$_DoacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomePet: ${nomePet},
raca: ${raca},
animation: ${animation},
animationController: ${animationController},
vacinado: ${vacinado},
cadastrado: ${cadastrado},
chipado: ${chipado},
vermifugado: ${vermifugado},
valueSex: ${valueSex},
checkboxValue: ${checkboxValue},
firstValues: ${firstValues},
listaImagens: ${listaImagens}
    ''';
  }
}
