// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_page_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthPageState on _AuthPageStateBase, Store {
  late final _$formStateAtom =
      Atom(name: '_AuthPageStateBase.formState', context: context);

  @override
  AuthFormState get formState {
    _$formStateAtom.reportRead();
    return super.formState;
  }

  @override
  set formState(AuthFormState value) {
    _$formStateAtom.reportWrite(value, super.formState, () {
      super.formState = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_AuthPageStateBase.email', context: context);

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

  late final _$usernameAtom =
      Atom(name: '_AuthPageStateBase.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_AuthPageStateBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AuthPageStateBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_AuthPageStateBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$submitFormAsyncAction =
      AsyncAction('_AuthPageStateBase.submitForm', context: context);

  @override
  Future<void> submitForm() {
    return _$submitFormAsyncAction.run(() => super.submitForm());
  }

  late final _$_AuthPageStateBaseActionController =
      ActionController(name: '_AuthPageStateBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_AuthPageStateBaseActionController.startAction(
        name: '_AuthPageStateBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AuthPageStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_AuthPageStateBaseActionController.startAction(
        name: '_AuthPageStateBase.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_AuthPageStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_AuthPageStateBaseActionController.startAction(
        name: '_AuthPageStateBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthPageStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchForm() {
    final _$actionInfo = _$_AuthPageStateBaseActionController.startAction(
        name: '_AuthPageStateBase.switchForm');
    try {
      return super.switchForm();
    } finally {
      _$_AuthPageStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formState: ${formState},
email: ${email},
username: ${username},
password: ${password},
isLoading: ${isLoading},
isError: ${isError}
    ''';
  }
}
