import 'package:get/get.dart';
import 'package:flutter_application_1/models/userModel.dart';

class UserModelController extends GetxController {
  final user = UserModel(
    id: '',
    name: '',
    mail: '',
    password: '',
    comment: '',
  ).obs;

  void setUser({
    required String id,
    required String name,
    required String mail,
    required String password,
    required String comment,
  }) {
    user.update((val) {
      if (val != null) {
        val.setUser(
          id: id,
          name: name,
          mail: mail,
          password: password,
          comment: comment,
        );
      }
    });
  }
}
