// ignore_for_file: library_private_types_in_public_api

import 'package:authmobx/entities/user.dart';
import 'package:authmobx/usecases/get_user_from_prefs_usecase.dart';
import 'package:authmobx/usecases/remove_user_from_prefs_usecase.dart';
import 'package:authmobx/usecases/save_user_to_prefs_usecase.dart';
import 'package:mobx/mobx.dart';

part 'auth_state.g.dart';

class AuthState = _AuthStateBase with _$AuthState;

abstract class _AuthStateBase with Store {
  final SaveUserToPrefsUsecaseInterface saveUserToPrefsUsecase;
  final GetUserFromPrefsUsecaseInterface getUserFromPrefsUsecase;
  final RemoveUserFromPrefsUsecaseInterface removeUserFromPrefsUsecase;

  _AuthStateBase({
    required this.saveUserToPrefsUsecase,
    required this.getUserFromPrefsUsecase,
    required this.removeUserFromPrefsUsecase,
  }) {
    _tryAuthorize();
  }

  @observable
  UserEntity? currentUser;

  @action
  Future<void> authorize(UserEntity user) async {
    currentUser = user;
    await saveUserToPrefsUsecase.execute(user);
  }

  @action
  Future<void> unauthorize() async {
    currentUser = null;
    await removeUserFromPrefsUsecase.execute();
  }

  void _tryAuthorize() async {
    final user = await getUserFromPrefsUsecase.execute();
    currentUser = user;
  }
}
