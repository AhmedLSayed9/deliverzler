import 'package:deliverzler/auth/presentation/providers/user_provider.dart';
import 'package:deliverzler/core/data/error/app_exception.dart';
import 'package:deliverzler/core/data/local/image_picker_caller/i_image_picker_caller.dart';
import 'package:deliverzler/core/presentation/extensions/app_error_extension.dart';
import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:deliverzler/core/presentation/utils/dialogs.dart';
import 'package:deliverzler/features/profile/presentation/providers/pick_profile_image_provider.dart';
import 'package:deliverzler/features/profile/presentation/providers/update_profile_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/components/image_pick_component.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/cached_network_image_circular.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
                  message: (err as AppException).errorMessage(context),
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
          ref.read(selectedProfileImageProvider.notifier).state = Some(image);
        } catch (_) {}
      }
    }, []);

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CachedNetworkImageCircular(
          imageUrl: userImage,
          radius: Sizes.imageRadius66(context),
        ),
        Padding(
          padding: EdgeInsets.only(right: Sizes.paddingH6(context)),
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
