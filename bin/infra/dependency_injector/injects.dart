import '../../apis/login_api.dart';
import '../../apis/noticias_api.dart';
import '../../apis/usuario_api.dart';
import '../../dao/noticia_dao.dart';
import '../../dao/usuario_dao.dart';
import '../../models/noticia_model.dart';
import '../../services/generic_service.dart';
import '../../services/login_service.dart';
import '../../services/noticia_services.dart';
import '../../services/usuario_service.dart';
import '../database/db_configuration.dart';
import '../database/mysql_db_configuration.dart';
import '../security/security_service.dart';
import '../security/security_service_imp.dart';
import 'dependency_injector.dart';

class Injects {
  static DependencyInjector initialize() {
    var di = DependencyInjector();

    di.register<DBConfiguration>(() => MySqlDBConfiguration());
    di.register<SecurityService>(() => SecurityServiceImp());

    // NOTICIAS
    di.register<NoticiaDao>(() => NoticiaDao(di<DBConfiguration>()));
    di.register<GenericService<NoticiaModel>>(
      () => NoticiaService(di<NoticiaDao>()),
    );
    di.register<NoticiasApi>(
        () => NoticiasApi(di<GenericService<NoticiaModel>>()));

    // USUARIO
    di.register<UsuarioDAO>(() => UsuarioDAO(di<DBConfiguration>()));
    di.register<UsuarioService>(() => UsuarioService(di<UsuarioDAO>()));
    di.register<UsuarioApi>(() => UsuarioApi(di<UsuarioApi>()));

    // LOGIN
    di.register<LoginService>(() => LoginService(di<UsuarioService>()));
    di.register<LoginApi>(
        () => LoginApi(di<SecurityService>(), di<LoginService>()));

    return di;
  }
}
