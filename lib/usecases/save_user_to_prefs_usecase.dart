import 'package:authmobx/entities/user.dart';
import 'package:authmobx/services/save_user_to_prefs_service.dart';

abstract class SaveUserToPrefsUsecaseInterface {
  Future<void> execute(UserEntity user);
}

class SaveUserToPrefsUsecase implements SaveUserToPrefsUsecaseInterface {
  final SaveUserToPrefsServiceInterface service;

  SaveUserToPrefsUsecase({required this.service});

  @override
  Future<void> execute(UserEntity user) {
    return service.saveUserToPrefs(user);
  }
}
