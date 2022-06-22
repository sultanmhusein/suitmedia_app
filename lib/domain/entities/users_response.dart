import 'package:equatable/equatable.dart';
import 'package:suitmedia_app/data/models/users_response_model.dart';

class UsersResponse extends Equatable {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<User>? data;
  Support? support;

  UsersResponse(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data,
      this.support});

  UsersResponseModel get toModel => UsersResponseModel(
      page: page,
      perPage: perPage,
      total: total,
      totalPages: totalPages,
      data: data,
      support: support);

  @override
  List<Object?> get props {
    return [page, perPage, total, totalPages, data, support];
  }
}
