import 'package:flutter/cupertino.dart';
import 'package:t_store/features/user/models/user.model.dart';
import 'package:t_store/utils/http/endpoints.dart';
import 'package:t_store/utils/http/http_client.dart';

class UserViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  User? _user;
  User? get user => _user;

  void getUser(VoidCallback onSuccess, VoidCallback onError) async {
    try {
      _isLoading = true;

      var data = await THttpHelper.get(Endpoints.USER);

      _user = User.fromJson(data);
      _isLoading = false;
      notifyListeners();

      onSuccess();
    } catch (e, st) {
      onError();
      print(st);
      print(e);
    }
  }
}
