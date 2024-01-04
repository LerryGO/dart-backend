import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServerService {
  Handler get handler {
    final router = Router();

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

    return router.call;
  }
}
