import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliverzler/core/services/cache_service.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/styles/app_images.dart';

class CachedNetworkImageCircular extends StatelessWidget {
  final String? imageUrl;
  final String spareImageUrl;
  final double radius;
  final int? maxHeightDiskCache;
  final int? maxWidthDiskCache;

  const CachedNetworkImageCircular({
    required this.imageUrl,
    this.spareImageUrl =
        'https://firebasestorage.googleapis.com/v0/b/deliverzler.appspot.com/o/profile_pic4.png?alt=media&token=60fc5dbb-93ab-4f2b-89fe-d378f3a0ae6f',
    required this.radius,
    this.maxHeightDiskCache = 400,
    this.maxWidthDiskCache = 400,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: UniqueKey(),
      cacheManager: CacheService.instance.customCacheManager,
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
