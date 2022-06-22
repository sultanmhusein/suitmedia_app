import 'package:dartz/dartz.dart';
import 'package:suitmedia_app/data/datasources/remote/users_remote_datasource.dart';
import 'package:suitmedia_app/domain/entities/users_response.dart';
import 'package:suitmedia_app/domain/repositories/users_repository.dart';
import 'package:suitmedia_app/shared/failure.dart';
import 'package:suitmedia_app/shared/network_exception.dart';

class UsersRepositoryImpl extends UsersRepository {
  final UsersRemoteDatasource _remoteDatasource;

  UsersRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, UsersResponse>> getUsers() async {
    try {
      var result = await _remoteDatasource.getUsers();

      return Right(result!.toEntity());
    } on NetworkException catch (e) {
      return Left(ConnectionFailure(
          responseCode: e.responseCode,
          httpStatus: e.httpStatus,
          message: e.responseMessage));
    } catch (e) {
      return Left(ConnectionFailure(message: e.toString()));
    }
  }
}
