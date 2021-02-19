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

  final _$checkLoggedUserAsyncAction =
      AsyncAction('_UserStore.checkLoggedUser');

  @override
  Future<bool> checkLoggedUser() {
    return _$checkLoggedUserAsyncAction.run(() => super.checkLoggedUser());
  }

  @override
  String toString() {
    return '''
loggedUser: ${loggedUser}
    ''';
  }
}
