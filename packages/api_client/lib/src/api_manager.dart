abstract class APIManager {
  /// Fetch data from API
  Future<dynamic> get(String endpoint);

  /// Give data to API
  Future<dynamic> post(dynamic body);

  /// Delete record which is passed
  Future<dynamic> delete(dynamic id);

  /// Update data
  Future<dynamic> put(dynamic id, dynamic body);
}
