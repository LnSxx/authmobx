import 'package:authmobx/entities/user.dart';
import 'package:authmobx/services/log_in_service.dart';

abstract class LogInUsecaseInterface {
  Future<UserEntity> execute(String username, String password);
}

class LogInUsecase implements LogInUsecaseInterface {
  final LogInServiceInterface service;

  LogInUsecase({required this.service});

  @override
  Future<UserEntity> execute(String username, String password) {
    return service.logIn(username, password);
  }
}
