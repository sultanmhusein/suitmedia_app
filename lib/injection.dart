import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:suitmedia_app/data/datasources/remote/users_remote_datasource.dart';
import 'package:suitmedia_app/data/repositories/users_repository_impl.dart';
import 'package:suitmedia_app/domain/repositories/users_repository.dart';
import 'package:suitmedia_app/domain/usecases/get_users.dart';
import 'package:suitmedia_app/presentations/cubit/users_cubit.dart';
import 'package:suitmedia_app/shared/network.dart';

final locator = GetIt.instance;

void init({bool isTesting = false}) {
  if (!isTesting) {
    // Network
    locator.registerLazySingleton(() => Network(Dio()));

    // Remote Data
    locator.registerLazySingleton<UsersRemoteDatasource>(
        () => UsersRemoteDatasourceImpl(locator()));

    // Cubit
    locator.registerFactory(() => UsersCubit(locator()));

    // Usecase
    locator.registerLazySingleton(() => GetUsers(locator()));

    // Repository
    locator.registerLazySingleton<UsersRepository>(
        () => UsersRepositoryImpl(locator()));
  }
}
