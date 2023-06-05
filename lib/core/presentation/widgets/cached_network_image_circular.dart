import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../services/cache_service.dart';
import '../styles/app_images.dart';
import '../utils/riverpod_framework.dart';

class CachedNetworkImageCircular extends ConsumerWidget {
  final String? imageUrl;
  final String spareImageUrl;
  final double radius;
  final int? maxHeightDiskCache;
  final int? maxWidthDiskCache;

  const CachedNetworkImageCircular({
    required this.imageUrl,
    this.spareImageUrl =
        '',
    required this.radius,
    this.maxHeightDiskCache = 400,
    this.maxWidthDiskCache = 400,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final cacheService = ref.watch(cacheServiceProvider);

    return CachedNetworkImage(
      key: UniqueKey(),
      cacheManager: cacheService.customCacheManager,
      imageUrl: imageUrl != null && imageUrl!.contains('http')
          ? imageUrl!
          : spareImageUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: radius,
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage(AppImages.loadingGIF),
      ),
      errorWidget: (context, url, error) => CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage(AppImages.noInternet),
      ),
    );
  }
}
