import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServerService {
  Handler get handler {
    final router = Router();

    // ------------ GET ---------------//

    router.get('/', (Request request) {
      return Response(200, body: 'Primeira rota');
    });

    // http://localhost:8080/ola/mundo/Lerry
    // ola mundo
    router.get('/ola/mundo/<usuario>', (Request req, String usuario) {
      return Response.ok('Olá mundo $usuario',
          headers: {'Content-Type': 'text/plain'});
    });

    // http://localhost:8080/query?name=Lerry&age=25
    router.get('/query', (Request req) {
      String? name = req.url.queryParameters['name'];
      String? age = req.url.queryParameters['age'];
      return Response.ok('Query é: $name, idade: $age ',
          headers: {'Content-Type': 'text/plain'});
    });

    // ------------ POST ---------------//

    // BODY
     /* {
      "user": "admin",
      "password": "123"
     } */

    router.post('/login', (Request req) async {
      var result = await req.readAsString();
      Map json = jsonDecode(result);

      var user = json['user'];
      var password = json['password'];

      if (user == 'admin' && password == '123') {
        // Se usuário == admin e senha == 123
        return Response.ok('Bem vindo $user');
      } else {
        // Se não
        return Response.forbidden('Acesso negado');
      }
    });

    return router.call;
  }
}
