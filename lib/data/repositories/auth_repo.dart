import '../../domain/entities/user.dart';
import '../../domain/repositories/i_auth_repo.dart';
import '../datasources/i_local_auth_source.dart';

class AuthRepo implements IAuthRepo {
  final ILocalAuthSource localAuthSource;

  AuthRepo(this.localAuthSource);

  @override
  Future<User> getUserFromEmail(email) async {
    return await localAuthSource.getUserFromEmail(email);
  }

  @override
  Future<void> logout() async {
    await localAuthSource.logout();
  }

  @override
  Future<void> signup(email, password) async {
    await localAuthSource.signup(email, password);
  }

  @override
  Future<String> getLoggedUser() async {
    return await localAuthSource.getLoggedUser();
  }

  @override
  Future<bool> isLogged() async {
    return await localAuthSource.isLogged();
  }

  @override
  Future<void> setLoggedIn() async {
    await localAuthSource.setLoggedIn();
  }
}
