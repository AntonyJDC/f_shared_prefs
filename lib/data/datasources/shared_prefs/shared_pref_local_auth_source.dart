import '../../../domain/entities/user.dart';
import '../i_local_auth_source.dart';
import 'local_preferences.dart';

class SharedPrefLocalAuthSource implements ILocalAuthSource {
  final _sharedPreferences = LocalPreferences();

  @override
  Future<String> getLoggedUser() async {
    return await _sharedPreferences.retrieveData<String>('user') ?? "noUser";
  }

  @override
  Future<void> logout() async {
    await _sharedPreferences.storeData('logged', false);
  }

  @override
  Future<User> getUserFromEmail(dynamic email) async {
    final userData = await _sharedPreferences.retrieveData<Map<String, dynamic>>('user_$email');
    if (userData != null) {
      return User(
        email: userData['email'],
        password: userData['password'],
      );
    } else {
      throw Exception('User not found');
    }
  }

  @override
  Future<bool> isLogged() async {
    return await _sharedPreferences.retrieveData<bool>('logged') ?? false;
  }

  @override
  Future<void> signup(dynamic email, dynamic password) async {
    final user = {
      'email': email,
      'password': password,
    };
    await _sharedPreferences.storeData('user_$email', user);
  }

  @override
  Future<void> setLoggedIn() async {
    await _sharedPreferences.storeData('logged', true);
  }
}
