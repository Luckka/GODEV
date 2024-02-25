import 'package:flutter_modular/flutter_modular.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_bloc.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_state.dart';
import 'package:godev/app/modules/home/presenter/pages/home_page.dart';

class HomeModule extends Module{
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => HomeBloc())
  ];


  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (args,context) => HomePage(homeBloc: Modular.get<HomeBloc>()))
  ];
}