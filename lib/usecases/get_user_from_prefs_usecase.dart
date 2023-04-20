import 'package:authmobx/entities/user.dart';
import 'package:authmobx/services/get_user_from_prefs_service.dart';

abstract class GetUserFromPrefsUsecaseInterface {
  Future<UserEntity?> execute();
}

class GetUserFromPrefsUsecase implements GetUserFromPrefsUsecaseInterface {
  final GetUserFromPrefsServiceInterface service;

  GetUserFromPrefsUsecase({required this.service});

  @override
  Future<UserEntity?> execute() {
    return service.getUserFromPrefs();
  }
}
