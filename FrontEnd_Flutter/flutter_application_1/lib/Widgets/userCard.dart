import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/userModel.dart'; // Ajusta la ruta si es necesario
import '../controllers/userEditFormController.dart'; // Asegúrate de tener importado el formulario de usuario

class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Información del usuario
            Text(
              user.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(user.mail),
            const SizedBox(height: 8),
            Text(user.comment ?? "Sin comentarios"),

            const SizedBox(height: 16), // Espacio entre la información y los botones

            // Botones de acción
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Botón de editar
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // Aquí pasas el objeto completo del usuario para editar
                    Get.to(() => EditUserForm(userId:user.id, user: user));  // Aquí pasas el usuario seleccionado
                  },
                ),

                // Botón de eliminar
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Muestra una confirmación antes de eliminar
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Eliminar Usuario'),
                          content: Text(
                              '¿Estás seguro de que quieres eliminar a ${user.name}?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Cerrar diálogo
                              },
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Cierra el diálogo
                                // Llama a la función de eliminar usuario
                                // Aquí podrías llamar a un controlador o servicio para eliminar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Eliminado: ${user.name}'),
                                  ),
                                );
                              },
                              child: Text('Eliminar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
