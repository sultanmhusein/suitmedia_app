import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_app/domain/entities/users_response.dart';
import 'package:suitmedia_app/domain/usecases/get_users.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._getUsers) : super(UsersInitial());

  final GetUsers _getUsers;

  void getUsers() async {
    emit(UsersLoading());

    var result = await _getUsers.execute();
    result.fold((failed) => emit(UsersFailed(failed.message)),
        (data) => emit(UsersLoaded(data)));
  }
}
