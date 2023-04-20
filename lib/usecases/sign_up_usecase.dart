import 'package:authmobx/entities/user.dart';
import 'package:authmobx/services/sign_up_service.dart';

abstract class SignUpUsecaseInterface {
  Future<UserEntity> execute(String email, String username, String password);
}

class SignUpUsecase implements SignUpUsecaseInterface {
  final SignUpServiceInterface service;

  SignUpUsecase({required this.service});

  @override
  Future<UserEntity> execute(String email, String username, String password) {
    return service.signUp(email, username, password);
  }
}
