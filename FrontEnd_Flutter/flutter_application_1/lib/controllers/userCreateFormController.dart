import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/userController.dart';

class CreateUserForm extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  CreateUserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Usuario')),
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
            onPressed: () {
              Get.to(() => CreateUserForm());
            },
            child: Text('Crear Usuario'),
          ),

          ],
        ),
      ),
    );
  }
}
