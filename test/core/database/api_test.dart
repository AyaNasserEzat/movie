import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/database/api/dio_concumer.dart';

import 'api_test.mocks.dart';


@GenerateMocks([Dio])

void main() {
  late DioConcumer dioConsumer;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
        // مهم: نعمل stub للـ options
    when(mockDio.options).thenReturn(BaseOptions());
  // Stub للـ interceptors
  when(mockDio.interceptors).thenReturn(Interceptors());

    dioConsumer = DioConcumer(dio: mockDio);
  });

  test('should return data when get request succeeds', () async {
    when(mockDio.get(any)).thenAnswer((_) async => Response(
      requestOptions: RequestOptions(path: ''),
      data: {'result': 'ok'},
      statusCode: 200,
    ));

    final result = await dioConsumer.get('/test');
    expect(result, {'result': 'ok'});
  });
  
 }
