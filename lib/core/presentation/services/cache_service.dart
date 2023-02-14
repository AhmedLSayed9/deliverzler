import 'package:flutter/cupertino.dart';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_service.g.dart';

@Riverpod(keepAlive: true)
CacheService cacheService(CacheServiceRef ref) {
  return CacheService(
    customCacheManager: CacheManager(
      Config(
        'customCacheKey',
        maxNrOfCacheObjects: 100,
        stalePeriod: const Duration(days: 30),
      ),
    ),
  );
}

class CacheService {
  const CacheService({
    required this.customCacheManager,
  });

  final CacheManager customCacheManager;

  clearCustomCache() async {
    await customCacheManager.emptyCache();
  }

  clearAllCache() async {
    await customCacheManager.emptyCache();
    //These clear app's live cache not global or stored cache
    imageCache.clear();
    imageCache.clearLiveImages();
  }

  removeFileFromCache(String cacheKey) async {
    await customCacheManager.removeFile(cacheKey);
  }
}
