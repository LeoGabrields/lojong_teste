import 'package:dio/dio.dart';
import 'package:dio/io.dart';

final class RestClient extends DioForNative {
  RestClient()
      : super(
          BaseOptions(
            baseUrl: 'https://applojong.com/api/',
            headers: {
              'Authorization':
                  'Bearer O7Kw5E2embxod5YtL1h1YsGNN7FFN8wIxPYMg6J9zFjE6Th9oDssEsFLVhxf'
            },
            connectTimeout: const Duration(seconds: 10),
          ),
        );
}
