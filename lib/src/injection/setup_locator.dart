import 'package:api_client/api_client.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<APIManager>(APIManagerImpl());
}
