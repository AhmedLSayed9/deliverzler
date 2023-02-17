import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../auth/presentation/providers/user_provider.dart';
import '../../../../core/data/local/image_picker_caller/i_image_picker_caller.dart';
import '../../../../core/domain/entities/event.dart';
import '../../../../core/presentation/components/image_pick_component.dart';
import '../../../../core/presentation/extensions/app_error_extension.dart';
import '../../../../core/presentation/routing/navigation_service.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/utils/dialogs.dart';
import '../../../../core/presentation/utils/functional.dart';
import '../../../../core/presentation/widgets/cached_network_image_circular.dart';
import '../providers/pick_profile_image_provider.dart';
import '../providers/update_profile_image_provider.dart';

class UserImageComponent extends HookConsumerWidget {
  const UserImageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final userImage =
        ref.watch(currentUserProvider.select((user) => user.image));

    ref.listen<AsyncValue<Option<String>>>(
      updateProfileImageStateProvider,
      (prevState, newState) {
        prevState?.unwrapPrevious().whenOrNull(
              loading: () => NavigationService.dismissDialog(context),
            );
        newState.unwrapPrevious().whenOrNull(
              loading: () => Dialogs.showLoadingDialog(context),
              error: (err, st) {
                Dialogs.showErrorDialog(
                  context,
                  message: err.errorMessage(context),
                );
              },
            );
      },
    );

    final pickImage = useCallback((PickSource pickSource) async {
      final bool canSubmit =
          !ref.read(updateProfileImageStateProvider).isLoading;

      if (canSubmit) {
        try {
          final image =
              await ref.read(pickProfileImageProvider(pickSource).future);
          ref
              .read(updateProfileImageEventProvider.notifier)
              .update((_) => Some(Event.unique(image)));
        } catch (_) {}
      }
    }, []);

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CachedNetworkImageCircular(
          imageUrl: userImage,
          radius: Sizes.imageR64,
        ),
        Padding(
          padding: const EdgeInsets.only(right: Sizes.paddingH8),
          child: ImagePickComponent(
            pickFromCameraFunction: () {
              pickImage(PickSource.camera);
            },
            pickFromGalleryFunction: () {
              pickImage(PickSource.gallery);
            },
          ),
        ),
      ],
    );
  }
}
