import 'package:flutter_modular/flutter_modular.dart';
import 'package:godev/app/core/app_routes.dart';
import 'package:godev/app/modules/home/domain/usecase/follow_user_usecase_impl.dart';
import 'package:godev/app/modules/home/external/follow_user_datasource_impl.dart';
import 'package:godev/app/modules/home/home_module.dart';
import 'package:godev/app/modules/home/infra/repository/follow_user_repository_impl.dart';
import 'package:godev/app/modules/home/presenter/pages/profile_page.dart';
import 'package:godev/app/modules/login/login_module.dart';
import 'package:godev/app/modules/signup/sign_up_module.dart';

import 'modules/home/domain/usecase/delete_post_usecase_impl.dart';
import 'modules/home/domain/usecase/post_comment_usecase_impl.dart';
import 'modules/home/domain/usecase/update_like_usecase_impl.dart';
import 'modules/home/domain/usecase/upload_post_usecase_impl.dart';
import 'modules/home/external/delete_post_datasource_impl.dart';
import 'modules/home/external/post_comment_datasource_impl.dart';
import 'modules/home/external/update_like_datasource_impl.dart';
import 'modules/home/external/upload_post_datasource_impl.dart';
import 'modules/home/infra/repository/delete_post_repository_impl.dart';
import 'modules/home/infra/repository/post_comment_repository_impl.dart';
import 'modules/home/infra/repository/update_like_repository_impl.dart';
import 'modules/home/infra/repository/upload_post_repository_impl.dart';
import 'modules/home/presenter/bloc/home_bloc.dart';
import 'modules/home/presenter/pages/comments_page.dart';

class AppModule extends Module{
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => UploadPostUseCaseImpl(uploadPostRepository: i())),
    Bind.lazySingleton((i) => UploadPostDatasourceImpl()),
    Bind.lazySingleton((i) => UploadPostRepositoryImpl(uploadPostDatasource: i())),
    Bind.lazySingleton((i) => HomeBloc(uploadPostUseCase: i(), updateLikeUseCase: i(), postCommentUseCase: i(), deletePostUseCase: i(), followUserUseCase: i())),
    Bind.lazySingleton((i) => UpdateLikeUseCaseImpl(updateLikeRepository: i())),
    Bind.lazySingleton((i) => UpdateLikeDatasourceImpl()),
    Bind.lazySingleton((i) => UpdateLikeRepositoryImpl(updateLikeDatasource: i())),
    Bind.lazySingleton((i) => PostCommentDatasourceImpl()),
    Bind.lazySingleton((i) => PostCommentUseCaseImpl(postCommentRepository: i())),
    Bind.lazySingleton((i) => PostCommentRepositoryImpl(postCommentDatasource: i())),
    Bind.lazySingleton((i) => DeletePostUseCaseImpl(deletePostRepository: i())),
    Bind.lazySingleton((i) => DeletePostDatasourceImpl()),
    Bind.lazySingleton((i) => DeletePostRepositoryImpl(deletePostDatasource: i())),
    Bind.lazySingleton((i) => FollowUserDatasourceImpl()),
    Bind.lazySingleton((i) => FollowUserRepositoryImpl(followUserDatasource: i())),
    Bind.lazySingleton((i) => FollowUserUseCaseImpl(followUserRepository: i()))

  ];


  @override
  List<ModularRoute> get routes => [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute(AppRoutes.signup, module: SignUpModule()),
    ModuleRoute(AppRoutes.home, module: HomeModule()),
    ChildRoute('/comments', child: (_,args) => CommentsPage(homeBloc: Modular.get<HomeBloc>(), snap: args.queryParams['snap'],)),
    ChildRoute("/profile", child: (_,args) => ProfilePage(uid: args.queryParams['uid']!, homeBloc: Modular.get<HomeBloc>(),))

  ];
}