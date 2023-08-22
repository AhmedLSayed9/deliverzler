import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../gen/my_assets.dart';
import '../../infrastructure/services/cache_service.dart';
import '../utils/riverpod_framework.dart';

class CachedNetworkImageCircular extends ConsumerWidget {
  const CachedNetworkImageCircular({
    required this.imageUrl,
    required this.radius,
    this.spareImageUrl = '',
    this.maxHeightDiskCache = 400,
    this.maxWidthDiskCache = 400,
    super.key,
  });
  final String? imageUrl;
  final String spareImageUrl;
  final double radius;
  final int? maxHeightDiskCache;
  final int? maxWidthDiskCache;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cacheService = ref.watch(cacheServiceProvider);

    return CachedNetworkImage(
      key: UniqueKey(),
      cacheManager: cacheService.customCacheManager,
      imageUrl: imageUrl != null && imageUrl!.contains('http') ? imageUrl! : spareImageUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: radius,
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage(MyAssets.ASSETS_IMAGES_CORE_LOADING_GIF),
      ),
      errorWidget: (context, url, error) => CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage(MyAssets.ASSETS_IMAGES_CORE_NO_INTERNET_JPG),
      ),
    );
  }
}
