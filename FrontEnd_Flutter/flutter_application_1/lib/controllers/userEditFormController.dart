import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/userController.dart';
import 'package:flutter_application_1/models/userModel.dart';
import 'package:flutter_application_1/controllers/userListController.dart';

class EditUserForm extends StatelessWidget {
  final String userId;
  final UserModel user;

  final UserController userController = Get.find<UserController>();

  EditUserForm({
    Key? key,
    required this.userId,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    userController.loadUserData(user);

    return Scaffold(
      appBar: AppBar(title: const Text('Modificar Usuario')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: userController.nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: userController.mailController,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: userController.passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            TextField(
              controller: userController.commentController,
              decoration: const InputDecoration(labelText: 'Comentario'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
            onPressed: () async {
              await userController.updateUser(userId); // Sin problemas.
              Get.find<UserListController>().fetchUsers();
              Get.back(); // Cierra la pantalla después de guardar los cambios.
            },
            child: const Text('Guardar Cambios'),
          ),
          ],
        ),
      ),
    );
  }
}
