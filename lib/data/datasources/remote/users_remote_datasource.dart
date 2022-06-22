import 'package:get/get_connect.dart';
import 'package:suitmedia_app/config/api_config.dart';
import 'package:suitmedia_app/data/models/users_response_model.dart';
import 'package:suitmedia_app/shared/network.dart';
import 'package:suitmedia_app/shared/response_server.dart';

abstract class UsersRemoteDatasource {
  Future<UsersResponseModel?> getUsers();
}

class UsersRemoteDatasourceImpl extends UsersRemoteDatasource {
  final Network _network;

  UsersRemoteDatasourceImpl(this._network);

  @override
  Future<UsersResponseModel?> getUsers() async {
    var response = await _network.request(
        "GET", ApiConfig.users + "?page=1&amp;per_page=10",
        contentType: "application/json", content: "") as ResponseServer;

    return UsersResponseModel.fromMap(response.data);
  }
}
