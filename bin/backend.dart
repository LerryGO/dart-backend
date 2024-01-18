import 'package:shelf/shelf.dart';

import 'apis/blog_api.dart';
import 'apis/login_api.dart';
import 'dao/usuario_dao.dart';
import 'infra/custom_server.dart';
import 'infra/database/db_configuration.dart';
import 'infra/dependency_injector/injects.dart';
import 'infra/middleware_interception.dart';
import 'models/usuario_model.dart';
import 'utils/custom_env.dart';

void main() async {
  CustomEnv.fromFile('.env-dev');

  final di = Injects.initialize();

  var conexao = await di<DBConfiguration>().connection;

  UsuarioDAO usuarioDAO = UsuarioDAO(di<DBConfiguration>());

  var usuario = UsuarioModel()
    ..id = 14
    ..name = 'NOVO USUARIO'
    ..email = 'novo@email.com'
    ..password = '123';
  usuarioDAO.findAll().then(print); // LIST
  usuarioDAO.findOne(1).then(print); // OBJ 1
  usuarioDAO.create(usuario).then(print); // TRUE
  usuario.name = 'ATUALIZADO';
  usuarioDAO.update(usuario).then(print); // TRUE
  usuarioDAO.delete(14).then(print); // TRUE

  (await usuarioDAO.findAll()).forEach(print);

  var cascadeHandler = Cascade()
      .add(di.get<LoginApi>().getHandler())
      .add(di.get<BlogApi>().getHandler(isSecurity: true))
      .handler;

  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware((MiddlewareInterception().middleware))
      .addHandler(cascadeHandler);

  await CustomServer().initialize(
      handler: handler,
      address: await CustomEnv.get<String>(key: 'server_address'),
      port: await CustomEnv.get<int>(key: 'server_port'));
}
