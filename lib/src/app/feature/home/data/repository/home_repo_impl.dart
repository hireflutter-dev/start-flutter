import 'dart:convert';
import 'dart:io';

import 'package:constant/constant.dart';
import 'package:hf_flutter_starter_kit/src/app/core/failure/failure.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/entity/github_user.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/repository/home_repo.dart';
import 'package:http/http.dart' as http;

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<List<GithubUser>?> getUser() async {
    try {
      final url = Uri.parse(APIConstant.baseUrl + 'users');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        return jsonDecode(response.body)
            .map<GithubUser>((e) => GithubUser.fromJson(e))
            .toList();
      } else if (response.statusCode == 401) {
        throw Failure(StringConstant.unAuthorized);
      }
    } on SocketException {
      throw Failure(StringConstant.noInternet);
    } on FormatException {
      throw Failure(StringConstant.badFormat);
    } catch (e) {
      throw Failure(StringConstant.unexpectedError);
    }
  }
}
