import 'package:dartz/dartz.dart';
import 'package:suitmedia_app/domain/entities/users_response.dart';
import 'package:suitmedia_app/shared/failure.dart';

abstract class UsersRepository {
  Future<Either<Failure, UsersResponse>> getUsers();
}
