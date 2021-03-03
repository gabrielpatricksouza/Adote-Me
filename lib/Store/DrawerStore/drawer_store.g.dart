// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DrawerStore on _DrawerStore, Store {
  final _$numWidgetAtom = Atom(name: '_DrawerStore.numWidget');

  @override
  int get numWidget {
    _$numWidgetAtom.reportRead();
    return super.numWidget;
  }

  @override
  set numWidget(int value) {
    _$numWidgetAtom.reportWrite(value, super.numWidget, () {
      super.numWidget = value;
    });
  }

  final _$_DrawerStoreActionController = ActionController(name: '_DrawerStore');

  @override
  void setNumWidget(int num) {
    final _$actionInfo = _$_DrawerStoreActionController.startAction(
        name: '_DrawerStore.setNumWidget');
    try {
      return super.setNumWidget(num);
    } finally {
      _$_DrawerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
numWidget: ${numWidget}
    ''';
  }
}
