import 'package:flutter_modular/flutter_modular.dart';
import 'package:godev/app/modules/login/login_module.dart';

class AppModule extends Module{
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => super.binds;


  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ModuleRoute(Modular.initialRoute, module: LoginModule())
  ];
}