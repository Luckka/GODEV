import 'package:flutter_modular/flutter_modular.dart';
import 'package:godev/app/core/app_routes.dart';
import 'package:godev/app/modules/home/home_module.dart';
import 'package:godev/app/modules/login/login_module.dart';
import 'package:godev/app/modules/signup/sign_up_module.dart';

class AppModule extends Module{
  @override
  List<Bind> get binds => [

  ];


  @override
  List<ModularRoute> get routes => [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute(AppRoutes.signup, module: SignUpModule()),
    ModuleRoute(AppRoutes.home, module: HomeModule()),

  ];
}