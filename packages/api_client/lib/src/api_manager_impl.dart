import 'dart:io';

import 'package:constant/constant.dart';
import 'package:http/http.dart' as http;
import 'api_manager.dart';
import 'failure/failure.dart';

class APIManagerImpl extends APIManager {
  @override
  Future delete(id) {
    throw UnimplementedError();
  }

  @override
  Future get(String endpoint) async {
    try {
      final url = Uri.parse(APIConstant.baseUrl + endpoint);

      final response = await http.get(url);

      if (response.statusCode == 200) {
        return response.body;
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

  @override
  Future post(body) {
    throw UnimplementedError();
  }

  @override
  Future put(id, body) {
    throw UnimplementedError();
  }
}
