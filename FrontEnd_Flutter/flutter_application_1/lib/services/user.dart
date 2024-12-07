import 'dart:convert';
import 'package:flutter_application_1/models/userModel.dart';
import 'package:dio/dio.dart';

class UserService {
  final String baseUrl = "http://127.0.0.1:4000"; // URL de tu backend Web
  //final String baseUrl = "http://10.0.2.2:3000"; // URL de tu backend Android
  final Dio dio = Dio(); // Usa el prefijo 'Dio' para referenciar la clase Dio
  var statusCode;
  var data;

  //Función createUser
  Future<int> createUser(UserModel newUser) async {
    print('createUser');
    print('try');
    //Aquí llamamos a la función request
    print('request');
    // Utilizar Dio para enviar la solicitud POST a http://127.0.0.1:3000/user
    Response response =
        await dio.post('$baseUrl/user/newUser', data: newUser.toJson());
    print('response');
    //En response guardamos lo que recibimos como respuesta
    //Printeamos los datos recibidos

    data = response.data.toString();
    print('Data: $data');
    //Printeamos el status code recibido por el backend

    statusCode = response.statusCode;
    print('Status code: $statusCode');

    if (statusCode == 200) {
      // Si el usuario se crea correctamente, retornamos el código 201
      print('200');
      return 201;
    } else if (statusCode == 400) {
      // Si hay campos faltantes, retornamos el código 400
      print('400');

      return 400;
    } else if (statusCode == 500) {
      // Si hay un error interno del servidor, retornamos el código 500
      print('500');

      return 500;
    } else {
      // Otro caso no manejado
      print('-1');

      return -1;
    }
  }

  Future<List<UserModel>> getUsers() async {
    print('getUsers');
    try {
      var res = await dio.get('$baseUrl/user');
      List<dynamic> responseData =
          res.data; // Obtener los datos de la respuesta

      // Convertir los datos en una lista de objetos Place
      List<UserModel> users =
          responseData.map((data) => UserModel.fromJson(data)).toList();

      return users; // Devolver la lista de lugares
    } catch (e) {
      // Manejar cualquier error que pueda ocurrir durante la solicitud
      print('Error fetching data: $e');
      throw e; // Relanzar el error para que el llamador pueda manejarlo
    }
  }

Future<int> updateUser(String id, UserModel updatedUser) async {
    print('updateUser');
    print('try');
    //Aquí llamamos a la función request
    print('request');

    // Utilizar Dio para enviar la solicitud POST a http://127.0.0.1:3000/user
    Response response =
        await dio.put('$baseUrl/user/$id', data: updatedUser.toJson());
    //En response guardamos lo que recibimos como respuesta
    //Printeamos los datos recibidos

    data = response.data.toString();
    print('Data: $data');
    //Printeamos el status code recibido por el backend

    statusCode = response.statusCode;
    print('Status code: $statusCode');

    if (statusCode == 201) {
      // Si el usuario se crea correctamente, retornamos el código 201
      print('201');
      return 201;
    } else if (statusCode == 400) {
      // Si hay campos faltantes, retornamos el código 400
      print('400');

      return 400;
    } else if (statusCode == 500) {
      // Si hay un error interno del servidor, retornamos el código 500
      print('500');

      return 500;
    } else {
      // Otro caso no manejado
      print('-1');

      return -1;
    }
  }

  Future<int> deleteUser(String id) async {
    print('createUser');
    print('try');
    //Aquí llamamos a la función request
    print('request');

    // Utilizar Dio para enviar la solicitud POST a http://127.0.0.1:3000/user
    Response response =
        await dio.delete('$baseUrl/user/$id');
    //En response guardamos lo que recibimos como respuesta
    //Printeamos los datos recibidos

    data = response.data.toString();
    print('Data: $data');
    //Printeamos el status code recibido por el backend

    statusCode = response.statusCode;
    print('Status code: $statusCode');

    if (statusCode == 201) {
      // Si el usuario se crea correctamente, retornamos el código 201
      print('201');
      return 201;
    } else if (statusCode == 400) {
      // Si hay campos faltantes, retornamos el código 400
      print('400');

      return 400;
    } else if (statusCode == 500) {
      // Si hay un error interno del servidor, retornamos el código 500
      print('500');

      return 500;
    } else {
      // Otro caso no manejado
      print('-1');

      return -1;
    }
  }

  Future<int> logIn(logIn) async {
    print('LogIn');
    print('try');
    //Aquí llamamos a la función request
    print('request');

    print('el login es:${logIn}');

    Response response =
        await dio.post('$baseUrl/user/logIn', data: logInToJson(logIn));
    //En response guardamos lo que recibimos como respuesta
    //Printeamos los datos recibidos

    data = response.data.toString();
    print('Data: $data');
    //Printeamos el status code recibido por el backend

    statusCode = response.statusCode;
    print('Status code: $statusCode');

    if (statusCode == 200) {
      print('200');
      return 201;
    } else if (statusCode == 400) {
      // Si hay campos faltantes, retornamos el código 400
      print('400');

      return 400;
    } else if (statusCode == 500) {
      // Si hay un error interno del servidor, retornamos el código 500
      print('500');

      return 500;
    } else {
      // Otro caso no manejado
      print('-1');

      return -1;
    }
  }
  

  Map<String, dynamic> logInToJson(logIn) {
    return {'mail': logIn.mail, 'password': logIn.password};
  }
}
