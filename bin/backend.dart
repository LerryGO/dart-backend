import 'package:shelf/shelf.dart';

import 'api/blog_api.dart';
import 'api/login_api.dart';
import 'infra/custom_server.dart';

void main() async {
  var cascadeHandler =
      Cascade().add(LoginApi().handler).add(BlogApi().handler).handler;

  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  await CustomServer().initialize(handler);
}

/* void main() async {
  var serverService = ServerService();
  // Iniciando o servidor
  final server = await shelf_io.serve(serverService.handler, 'localhost', 8080);
  print('Nosso servidor foi iniciado http://localhost:8080');
} */
