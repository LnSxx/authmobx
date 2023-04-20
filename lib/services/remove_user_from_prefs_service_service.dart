
import 'package:shared_preferences/shared_preferences.dart';

abstract class RemoveUserFromPrefsServiceInterface {
  Future<void> removeUserFromPrefs();
}

class RemoveUserFromPrefsService
    implements RemoveUserFromPrefsServiceInterface {
  final SharedPreferences sharedPreferences;

  RemoveUserFromPrefsService({required this.sharedPreferences});

  @override
  Future<void> removeUserFromPrefs() async {
    await sharedPreferences.remove('user');
  }
}
