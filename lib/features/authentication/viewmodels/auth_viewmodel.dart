import 'package:flutter/cupertino.dart';
import 'package:t_store/utils/http/endpoints.dart';
import 'package:t_store/utils/http/http_client.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isLoginIn = false;
  bool get isLoginIn => _isLoginIn;

  bool _isRegistering = false;
  bool get isRegistering => _isRegistering;

  bool _isAuthError = false;
  bool get isAuthError => _isAuthError;

  String _authErrorMessage = '';
  String get authErrorMessage => _authErrorMessage;

  handleError(String error, VoidCallback onError) {
    _isAuthError = true;
    _authErrorMessage = error;
    onError();
    notifyListeners();
  }

  void login({
    required String email,
    required String password,
    required VoidCallback onSuccess,
    required VoidCallback onError,
  }) async {
    try {
      _isLoginIn = true;
      notifyListeners();

      await Future.delayed(Duration(seconds: 2));
      var response = await THttpHelper.post(Endpoints.LOGIN, {
        'email': email,
        'password': password,
      });
      var token = response['accessToken'];
      await TLocalStorage().saveData('access_token', token);

      print(response);
      onSuccess();
    } catch (err) {
      _isLoginIn = false;

      handleError(err.toString(), onError);
    }
  }

  void register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String username,
    required String phoneNumber,
    required VoidCallback onSuccess,
    required VoidCallback onError,
  }) async {
    try {
      _isRegistering = true;
      _isAuthError = false;
      notifyListeners();
      await Future.delayed(Duration(seconds: 2));

      var response = await THttpHelper.post(Endpoints.REGISTER, {
        'email': email,
        'password': password,
        'username': username,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber
      });

      print(response);
      onSuccess();
    } catch (err) {
      _isLoginIn = false;

      handleError(err.toString(), onError);
    }
  }
}
