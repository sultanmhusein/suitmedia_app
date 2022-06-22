import 'package:dartz/dartz.dart';
import 'package:suitmedia_app/domain/entities/users_response.dart';
import 'package:suitmedia_app/domain/repositories/users_repository.dart';
import 'package:suitmedia_app/shared/failure.dart';

class GetUsers {
  final UsersRepository _usersRepository;

  GetUsers(this._usersRepository);

  Future<Either<Failure, UsersResponse?>> execute() {
    return _usersRepository.getUsers();
  }
}
