// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$loggedUserAtom = Atom(name: '_UserStore.loggedUser');

  @override
  bool get loggedUser {
    _$loggedUserAtom.reportRead();
    return super.loggedUser;
  }

  @override
  set loggedUser(bool value) {
    _$loggedUserAtom.reportWrite(value, super.loggedUser, () {
      super.loggedUser = value;
    });
  }

  final _$logOutAtom = Atom(name: '_UserStore.logOut');

  @override
  bool get logOut {
    _$logOutAtom.reportRead();
    return super.logOut;
  }

  @override
  set logOut(bool value) {
    _$logOutAtom.reportWrite(value, super.logOut, () {
      super.logOut = value;
    });
  }

  final _$logOutUserAsyncAction = AsyncAction('_UserStore.logOutUser');

  @override
  Future<bool> logOutUser() {
    return _$logOutUserAsyncAction.run(() => super.logOutUser());
  }

  final _$recuperandoSenhaAsyncAction =
      AsyncAction('_UserStore.recuperandoSenha');

  @override
  Future<dynamic> recuperandoSenha(Usuario usuario) {
    return _$recuperandoSenhaAsyncAction
        .run(() => super.recuperandoSenha(usuario));
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  bool checkLoggedUser() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.checkLoggedUser');
    try {
      return super.checkLoggedUser();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loggedUser: ${loggedUser},
logOut: ${logOut}
    ''';
  }
}
