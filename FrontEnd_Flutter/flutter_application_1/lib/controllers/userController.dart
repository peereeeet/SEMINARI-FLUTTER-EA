import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/services/user.dart';
import 'package:flutter_application_1/models/userModel.dart';
//import 'package:flutter_application_1/models/userModel.dart';

class UserController extends GetxController {
  final UserService userService = Get.put(UserService());

  // Controladores de texto para la UI
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  // Variables reactivas para la UI
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void loadUserData(UserModel userData) {
  nameController.text = userData.name ?? '';
  mailController.text = userData.mail ?? '';
  passwordController.text = userData.password ?? '';
  commentController.text = userData.comment ?? '';
}


  void logIn() async {
    // Validación de campos
    if (mailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Campos vacíos',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Validación de formato de correo electrónico
    if (!GetUtils.isEmail(mailController.text)) {
      Get.snackbar('Error', 'Correo electrónico no válido',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    print('estoy en el login de usercontroller');

    final logIn = (
      mail: mailController.text,
      password: passwordController.text,
    );

    // Iniciar el proceso de inicio de sesión
    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Llamada al servicio para iniciar sesión
      final responseData = await userService.logIn(logIn);

      print('el response data es:${ responseData}');

      if (responseData != null) {
        // Manejo de respuesta exitosa
        Get.snackbar('Éxito', 'Inicio de sesión exitoso');
        Get.toNamed('/home');
      } else {
        errorMessage.value = 'Usuario o contraseña incorrectos';
      }
    } catch (e) {
      errorMessage.value = 'Error: No se pudo conectar con la API';
    } finally {
      isLoading.value = false;
    }
  }
Future<void> updateUser(String userId) async {
  final updatedUser = UserModel(
    id: userId,
    name: nameController.text,
    mail: mailController.text,
    password: passwordController.text,
    comment: commentController.text,
  );

  try {
    final statusCode = await userService.updateUser(userId, updatedUser);
    if (statusCode == 200) {
      Get.snackbar('Éxito', 'Usuario modificado correctamente');
    }
  } catch (e) {
    Get.snackbar('Error', 'No se pudo modificar el usuario');
  } finally {
    isLoading(false);
  }
}

void createUser() async {
  if (nameController.text.isEmpty || mailController.text.isEmpty) {
    Get.snackbar('Error', 'Campos vacíos', snackPosition: SnackPosition.BOTTOM);
    return;
  }

  isLoading(true);

  final newUser = UserModel(
    id: '', // Generar un ID vacío si el backend lo asigna automáticamente
    name: nameController.text,
    mail: mailController.text,
    password: passwordController.text,
    comment: commentController.text,
  );

  try {
    final statusCode = await userService.createUser(newUser);
    if (statusCode == 201) {
      Get.snackbar('Éxito', 'Usuario creado correctamente');
      Get.offNamed('/userList'); // Redirigir a la lista de usuarios
    } else {
      Get.snackbar('Error', 'No se pudo crear el usuario');
    }
  } finally {
    isLoading(false);
  }
}
}
