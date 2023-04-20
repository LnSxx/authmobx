// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthState on _AuthStateBase, Store {
  late final _$currentUserAtom =
      Atom(name: '_AuthStateBase.currentUser', context: context);

  @override
  UserEntity? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(UserEntity? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$authorizeAsyncAction =
      AsyncAction('_AuthStateBase.authorize', context: context);

  @override
  Future<void> authorize(UserEntity user) {
    return _$authorizeAsyncAction.run(() => super.authorize(user));
  }

  late final _$unauthorizeAsyncAction =
      AsyncAction('_AuthStateBase.unauthorize', context: context);

  @override
  Future<void> unauthorize() {
    return _$unauthorizeAsyncAction.run(() => super.unauthorize());
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser}
    ''';
  }
}
