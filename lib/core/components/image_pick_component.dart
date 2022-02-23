import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/styles/sizes.dart';

class ImagePickComponent extends StatelessWidget {
  const ImagePickComponent({
    required this.pickFromCameraFunction,
    required this.pickFromGalleryFunction,
    Key? key,
  }) : super(key: key);

  final Function pickFromCameraFunction;
  final Function pickFromGalleryFunction;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.symmetric(
        vertical: Sizes.vPaddingSmallest,
        horizontal: Sizes.hPaddingSmallest,
      ),
      constraints: const BoxConstraints(),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: CustomText.h3(
                context,
                tr(context).chooseOption,
                color: Colors.blue,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(
                    height: 1,
                  ),
                  ListTile(
                    onTap: () async {
                      try {
                        pickFromCameraFunction();
                        NavigationService.goBack();
                      } catch (error) {
                        NavigationService.goBack();
                      }
                    },
                    title: CustomText(
                      context,
                      tr(context).camera,
                    ),
                    leading: const Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  ListTile(
                    onTap: () async {
                      try {
                        pickFromGalleryFunction();
                        NavigationService.goBack();
                      } catch (error) {
                        NavigationService.goBack();
                      }
                    },
                    title: CustomText(
                      context,
                      tr(context).gallery,
                    ),
                    leading: const Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      shape: const CircleBorder(),
      fillColor: Theme.of(context).primaryColor,
      elevation: 1,
      child: ImageIcon(
        const AssetImage(AppImages.cameraIcon),
        size: Sizes.iconsSizes['s7'],
        color: AppColors.grey,
      ),
    );
  }
}
