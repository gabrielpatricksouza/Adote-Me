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

  final _$nomeAtom = Atom(name: '_UserStore.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$emailAtom = Atom(name: '_UserStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$urlImagemAtom = Atom(name: '_UserStore.urlImagem');

  @override
  String get urlImagem {
    _$urlImagemAtom.reportRead();
    return super.urlImagem;
  }

  @override
  set urlImagem(String value) {
    _$urlImagemAtom.reportWrite(value, super.urlImagem, () {
      super.urlImagem = value;
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
  Future<String> recuperandoSenha(String email) {
    return _$recuperandoSenhaAsyncAction
        .run(() => super.recuperandoSenha(email));
  }

  final _$mudandoEmailAsyncAction = AsyncAction('_UserStore.mudandoEmail');

  @override
  Future<Usuario> mudandoEmail(Usuario usuario) {
    return _$mudandoEmailAsyncAction.run(() => super.mudandoEmail(usuario));
  }

  final _$deletandoContaAsyncAction = AsyncAction('_UserStore.deletandoConta');

  @override
  Future<dynamic> deletandoConta() {
    return _$deletandoContaAsyncAction.run(() => super.deletandoConta());
  }

  final _$recuperandoDadosUsuarioAsyncAction =
      AsyncAction('_UserStore.recuperandoDadosUsuario');

  @override
  Future<dynamic> recuperandoDadosUsuario() {
    return _$recuperandoDadosUsuarioAsyncAction
        .run(() => super.recuperandoDadosUsuario());
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
logOut: ${logOut},
nome: ${nome},
email: ${email},
urlImagem: ${urlImagem}
    ''';
  }
}
