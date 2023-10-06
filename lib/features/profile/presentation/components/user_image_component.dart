import 'package:flutter/material.dart';

import '../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../core/infrastructure/local/image_picker_facade.dart';
import '../../../../core/presentation/components/image_pick_component.dart';
import '../../../../core/presentation/extensions/future_extensions.dart';
import '../../../../core/presentation/routing/navigation_service.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/event.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/cached_network_image_circular.dart';
import '../providers/pick_profile_image_provider.dart';
import '../providers/update_profile_image_provider.dart';

class UserImageComponent extends ConsumerWidget {
  const UserImageComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.easyListen(updateProfileImageStateProvider);

    final userImage = ref.watch(currentUserProvider.select((user) => user.image));

    void pickImage(PickSource pickSource, BuildContext ctx) {
      ref.read(pickProfileImageProvider(pickSource).future).then(
        (image) {
          ref
              .read(updateProfileImageEventProvider.notifier)
              .update((_) => Some(Event.unique(image)));
        },
      ).suppressError();
      NavigationService.popDialog(ctx);
    }

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CachedNetworkImageCircular(
          imageUrl: userImage,
          radius: 64,
        ),
        Padding(
          padding: const EdgeInsets.only(right: Sizes.paddingH8),
          child: ImagePickComponent(
            pickFromCameraCallBack: ref.isLoading(updateProfileImageStateProvider)
                ? null
                : (ctx) => pickImage(PickSource.camera, ctx),
            pickFromGalleryCallBack: ref.isLoading(updateProfileImageStateProvider)
                ? null
                : (ctx) => pickImage(PickSource.gallery, ctx),
          ),
        ),
      ],
    );
  }
}
