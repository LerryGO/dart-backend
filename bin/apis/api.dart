import 'package:shelf/shelf.dart';

import '../infra/dependency_injector/dependency_injector.dart';
import '../infra/security/security_service.dart';

abstract class Api {
  Handler getHandler({List<Middleware>? middlewares});

  Handler createHandler({
    required Handler router,
    List<Middleware>? middlewares,
  }) {
    final di = DependencyInjector();

    var securityService = di.get<SecurityService>();
    
    middlewares ??= [];

    var pipe = Pipeline();

    for (var m in middlewares) {
      pipe = pipe.addMiddleware(m);
    }

    return pipe.addHandler(router);
  }
}
