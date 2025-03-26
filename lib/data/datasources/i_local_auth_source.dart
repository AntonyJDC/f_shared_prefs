import '../../domain/entities/user.dart';

abstract class ILocalAuthSource {
  // this method is used to store the user in the local storage
  Future<void> signup(email, password);

  // this method logout the user
  // it sets a boolean in the local storage to false
  Future<void> logout();

  // this method is used to check if the user is logged in
  Future<bool> isLogged();

  // this method is used to get the email of the logged user
  Future<String> getLoggedUser();

  // this method is used to get the User from the email
  Future<User> getUserFromEmail(email);

  // this method is used to set the user as logged in
  // it sets a boolean in the local storage to true
  Future<void> setLoggedIn();
}
