import '../entities/user.dart';
import '../repositories/i_auth_repo.dart';

class AuthUseCase {
  final IAuthRepo _authenticationRepo;

  AuthUseCase(this._authenticationRepo);

  // this method is used to check if the user is logged in
  // it asks the repository if the user is logged in
  Future<bool> get init async => await _authenticationRepo.isLogged();

  // this method is used to login the user, it takes email and password as parameters
  // it asks the repository to get the user from the email
  // if the user is not found, it throws an error
  // if the user is found, it checks if the password is correct
  // if the password is correct, it sets the user as logged in
  Future<void> login(email, password) async {
    try {
      User user = await _authenticationRepo.getUserFromEmail(email);
      if (user.password != password) {
        throw "Incorrect password";
      }
    } catch (e) {
      // If it was already a known error, rethrow it
      if (e == "Incorrect password") {
        rethrow;
      }

      throw "User not found";
    }
    await _authenticationRepo.setLoggedIn();
  }

  // this method is used to signup the user, it takes email and password as parameters
  // it asks the repository to signup the user
  Future<void> signup(email, password) async {
    return await _authenticationRepo.signup(email, password);
  }

  // this method is used to logout the user
  // it asks the repository to logout the user
  Future<void> logout() async {
    await _authenticationRepo.logout();
  }
}
