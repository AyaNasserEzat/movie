import 'package:flutter_test/flutter_test.dart';
import 'package:movies/core/errors/error_model.dart';

void main() {
  group('ErrorModel', () {
    final tJson = {
      "status_code": 404,
      "status_message": "Not Found"
    };

    test('fromJson should return valid ErrorModel', () {
      final result = ErrorModel.fromJson(tJson);

      expect(result.status, 404);
      expect(result.errorMessage, "Not Found");
    });
  });
}
