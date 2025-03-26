import '../../domain/entities/user.dart';
import '../../domain/repositories/i_auth_repo.dart';
import '../datasources/i_local_auth_source.dart';

class AuthRepo implements IAuthRepo {
  final ILocalAuthSource localAuthSource;

  AuthRepo(this.localAuthSource);

  @override
  Future<User> getUserFromEmail(email) async {
    //TODO: implement getUserFromEmail
  }

  @override
  Future<void> logout() async {
    //TODO: implement logout
  }

  @override
  Future<void> signup(email, password) async {
    //TODO: implement signup
  }

  @override
  Future<String> getLoggedUser() async {
    //TODO: implement getLoggedUser
  }

  @override
  Future<bool> isLogged() async {
    //TODO: implement isLogged
  }

  @override
  Future<void> setLoggedIn() async {
    //TODO: implement setLoggedIn
  }
}
