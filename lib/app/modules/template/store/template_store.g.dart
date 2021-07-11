// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TemplateStore on _TemplateStore, Store {
  final _$usuarioLogadoAtom = Atom(name: '_TemplateStore.usuarioLogado');

  @override
  bool get usuarioLogado {
    _$usuarioLogadoAtom.reportRead();
    return super.usuarioLogado;
  }

  @override
  set usuarioLogado(bool value) {
    _$usuarioLogadoAtom.reportWrite(value, super.usuarioLogado, () {
      super.usuarioLogado = value;
    });
  }

  final _$_TemplateStoreActionController =
      ActionController(name: '_TemplateStore');

  @override
  bool checkLoggedUser() {
    final _$actionInfo = _$_TemplateStoreActionController.startAction(
        name: '_TemplateStore.checkLoggedUser');
    try {
      return super.checkLoggedUser();
    } finally {
      _$_TemplateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuarioLogado: ${usuarioLogado}
    ''';
  }
}
