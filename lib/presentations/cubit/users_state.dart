part of 'users_cubit.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final UsersResponse? users;

  UsersLoaded(this.users);
}

class UsersFailed extends UsersState {
  final String message;

  UsersFailed(this.message);
}
