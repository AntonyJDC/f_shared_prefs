import '../entities/user.dart';

abstract class IAuthRepo {
  // this method is used to get the user from the email
  // it takes the email as a parameter
  Future<User> getUserFromEmail(email);

  // this method is user to create user with email and password
  Future<void> signup(email, password);

  // this method is used to logout the user
  Future<void> logout();

  // this method is used to check if the user is logged in
  Future<bool> isLogged();

  // this method is used to get the email of the logged user
  Future<String> getLoggedUser();

  // this method is used to set the user as logged in
  Future<void> setLoggedIn();
}
