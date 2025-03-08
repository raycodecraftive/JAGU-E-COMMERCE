import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:t_store/features/user/models/user.model.dart';
import 'package:t_store/features/user/viewmodel/user.viewmodel.dart';

extension UserExtension on BuildContext {
  User get user => this.read<UserViewModel>().user!;
}
