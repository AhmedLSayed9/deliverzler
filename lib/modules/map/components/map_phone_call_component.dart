import 'package:deliverzler/core/utils/validators.dart';
import 'package:deliverzler/modules/map/viewmodels/map_state_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:deliverzler/modules/home/viewmodels/home_state_providers.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPhoneCallComponent extends ConsumerWidget {
  const MapPhoneCallComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isArrivedSelectedPlace = ref.watch(isArrivedSelectedPlaceProvider);
    final selectedOrderPhone = ref.watch(selectedOrderProvider)!.userPhone;

    return isArrivedSelectedPlace &&
            selectedOrderPhone.isNotEmpty &&
            Validators.instance.isNumeric(selectedOrderPhone)
        ? Positioned(
            top: Sizes.mapDirectionsInfoTop(context),
            right: Sizes.hPaddingMedium(context),
            child: FloatingActionButton(
              heroTag: const Text('fab2'),
              child: const Icon(
                Icons.phone,
                color: AppColors.white,
              ),
              backgroundColor: AppColors.lightThemePrimary,
              elevation: 2,
              onPressed: () async {
                final _phone = Uri.parse('tel:$selectedOrderPhone');
                if (await canLaunchUrl(_phone)) {
                  await launchUrl(_phone);
                } else {
                  AppDialogs.showErrorDialog(context);
                }
              },
            ),
          )
        : const SizedBox();
  }
}
