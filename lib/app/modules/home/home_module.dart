import 'package:flutter_modular/flutter_modular.dart';
import 'package:godev/app/modules/home/domain/usecase/upload_post_usecase_impl.dart';
import 'package:godev/app/modules/home/external/upload_post_datasource_impl.dart';
import 'package:godev/app/modules/home/infra/repository/upload_post_repository_impl.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_bloc.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_state.dart';
import 'package:godev/app/modules/home/presenter/pages/home_page.dart';

class HomeModule extends Module{
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => UploadPostUseCaseImpl(uploadPostRepository: i())),
    Bind.lazySingleton((i) => UploadPostDatasourceImpl()),
    Bind.lazySingleton((i) => UploadPostRepositoryImpl(uploadPostDatasource: i())),
    Bind.lazySingleton((i) => HomeBloc(uploadPostUseCase: i()))
  ];


  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (args,context) => HomePage(homeBloc: Modular.get<HomeBloc>()))
  ];
}