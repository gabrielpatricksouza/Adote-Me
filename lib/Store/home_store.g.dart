// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$isDrawerOpenAtom = Atom(name: '_HomeStore.isDrawerOpen');

  @override
  bool get isDrawerOpen {
    _$isDrawerOpenAtom.reportRead();
    return super.isDrawerOpen;
  }

  @override
  set isDrawerOpen(bool value) {
    _$isDrawerOpenAtom.reportWrite(value, super.isDrawerOpen, () {
      super.isDrawerOpen = value;
    });
  }

  final _$xOffsetAtom = Atom(name: '_HomeStore.xOffset');

  @override
  double get xOffset {
    _$xOffsetAtom.reportRead();
    return super.xOffset;
  }

  @override
  set xOffset(double value) {
    _$xOffsetAtom.reportWrite(value, super.xOffset, () {
      super.xOffset = value;
    });
  }

  final _$yOffsetAtom = Atom(name: '_HomeStore.yOffset');

  @override
  double get yOffset {
    _$yOffsetAtom.reportRead();
    return super.yOffset;
  }

  @override
  set yOffset(double value) {
    _$yOffsetAtom.reportWrite(value, super.yOffset, () {
      super.yOffset = value;
    });
  }

  final _$scaleFactorAtom = Atom(name: '_HomeStore.scaleFactor');

  @override
  double get scaleFactor {
    _$scaleFactorAtom.reportRead();
    return super.scaleFactor;
  }

  @override
  set scaleFactor(double value) {
    _$scaleFactorAtom.reportWrite(value, super.scaleFactor, () {
      super.scaleFactor = value;
    });
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void menuOff() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.menuOff');
    try {
      return super.menuOff();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void menuOn() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.menuOn');
    try {
      return super.menuOn();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDrawerOpen: ${isDrawerOpen},
xOffset: ${xOffset},
yOffset: ${yOffset},
scaleFactor: ${scaleFactor}
    ''';
  }
}
