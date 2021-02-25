// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DonationStore on _DonationStore, Store {
  final _$nomePetAtom = Atom(name: '_DonationStore.nomePet');

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

  final _$racaAtom = Atom(name: '_DonationStore.raca');

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

  final _$animationAtom = Atom(name: '_DonationStore.animation');

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
      Atom(name: '_DonationStore.animationController');

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

  final _$isCheckedAtom = Atom(name: '_DonationStore.isChecked');

  @override
  bool get isChecked {
    _$isCheckedAtom.reportRead();
    return super.isChecked;
  }

  @override
  set isChecked(bool value) {
    _$isCheckedAtom.reportWrite(value, super.isChecked, () {
      super.isChecked = value;
    });
  }

  final _$petCheckedAtom = Atom(name: '_DonationStore.petChecked');

  @override
  bool get petChecked {
    _$petCheckedAtom.reportRead();
    return super.petChecked;
  }

  @override
  set petChecked(bool value) {
    _$petCheckedAtom.reportWrite(value, super.petChecked, () {
      super.petChecked = value;
    });
  }

  final _$valueSexAtom = Atom(name: '_DonationStore.valueSex');

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

  final _$_DonationStoreActionController =
      ActionController(name: '_DonationStore');

  @override
  void setNomePet(String text) {
    final _$actionInfo = _$_DonationStoreActionController.startAction(
        name: '_DonationStore.setNomePet');
    try {
      return super.setNomePet(text);
    } finally {
      _$_DonationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRaca(String text) {
    final _$actionInfo = _$_DonationStoreActionController.startAction(
        name: '_DonationStore.setRaca');
    try {
      return super.setRaca(text);
    } finally {
      _$_DonationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeChecked() {
    final _$actionInfo = _$_DonationStoreActionController.startAction(
        name: '_DonationStore.changeChecked');
    try {
      return super.changeChecked();
    } finally {
      _$_DonationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePetChecked() {
    final _$actionInfo = _$_DonationStoreActionController.startAction(
        name: '_DonationStore.changePetChecked');
    try {
      return super.changePetChecked();
    } finally {
      _$_DonationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeValueSex(int value) {
    final _$actionInfo = _$_DonationStoreActionController.startAction(
        name: '_DonationStore.changeValueSex');
    try {
      return super.changeValueSex(value);
    } finally {
      _$_DonationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomePet: ${nomePet},
raca: ${raca},
animation: ${animation},
animationController: ${animationController},
isChecked: ${isChecked},
petChecked: ${petChecked},
valueSex: ${valueSex}
    ''';
  }
}
