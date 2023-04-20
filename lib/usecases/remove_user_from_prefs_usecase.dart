import 'package:authmobx/services/remove_user_from_prefs_service_service.dart';

abstract class RemoveUserFromPrefsUsecaseInterface {
  Future<void> execute();
}

class RemoveUserFromPrefsUsecase
    implements RemoveUserFromPrefsUsecaseInterface {
  final RemoveUserFromPrefsServiceInterface service;

  RemoveUserFromPrefsUsecase({required this.service});

  @override
  Future<void> execute() {
    return service.removeUserFromPrefs();
  }
}
