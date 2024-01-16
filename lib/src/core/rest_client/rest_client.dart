import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:flutter/foundation.dart';
import 'package:lojong_teste/src/core/path_provider/app_path_provider.dart';

final class RestClient extends DioForNative {
  RestClient()
      : super(
          BaseOptions(
            baseUrl: 'https://applojong.com/api/',
            headers: {
              'Authorization':
                  'Bearer O7Kw5E2embxod5YtL1h1YsGNN7FFN8wIxPYMg6J9zFjE6Th9oDssEsFLVhxf'
            },
          ),
        ) {
    interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: FileCacheStore(AppPathProvider.path),
          policy: CachePolicy.refreshForceCache,
          hitCacheOnErrorExcept: [401, 404],
          maxStale: const Duration(days: 7),
          priority: CachePriority.high,
        ),
      ),
    );
    if (kDebugMode) {
      interceptors.add(ChuckerDioInterceptor());
    }
  }
}
