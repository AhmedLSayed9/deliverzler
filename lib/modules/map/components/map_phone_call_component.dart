import 'package:deliverzler/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:deliverzler/modules/home/viewmodels/selected_order_providers.dart';
import 'package:deliverzler/modules/map/viewmodels/map_selected_place_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPhoneCallComponent extends ConsumerWidget {
  const MapPhoneCallComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isArrivedSelectedPlace = ref.watch(mapSelectedPlaceViewModel
        .select((selectedPlaceVM) => selectedPlaceVM.isArrivedSelectedPlace));
    final selectedOrderPhone = ref.watch(selectedOrderProvider)!.userPhone;

    return isArrivedSelectedPlace &&
            selectedOrderPhone.isNotEmpty &&
            Validators.instance.isNumeric(selectedOrderPhone)
        ? Positioned(
            top: Sizes.mapDirectionsInfoTop,
            right: Sizes.hPaddingMedium,
            child: FloatingActionButton(
              heroTag: const Text('fab2'),
              child: const Icon(
                Icons.phone,
                color: AppColors.white,
              ),
              backgroundColor: AppColors.primaryColor,
              elevation: 2,
              onPressed: () async {
                final _phone = 'tel:$selectedOrderPhone';
                if (await canLaunch(_phone)) {
                  await launch(_phone);
                } else {
                  AppDialogs.showDefaultErrorDialog();
                }
              },
            ),
          )
        : const SizedBox();
  }
}
