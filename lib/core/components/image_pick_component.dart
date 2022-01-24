import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        Get.dialog(
          AlertDialog(
            title: CustomText.h3(
              context,
              tr('chooseOption'),
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
                      Get.back();
                    } catch (error) {
                      Get.back();
                    }
                  },
                  title: CustomText(
                    tr('camera'),
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
                      Get.back();
                    } catch (error) {
                      Get.back();
                    }
                  },
                  title: CustomText(
                    tr('gallery'),
                  ),
                  leading: const Icon(
                    Icons.account_box,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      shape: const CircleBorder(),
      fillColor: context.theme.primaryColor,
      elevation: 1,
      child: ImageIcon(
        const AssetImage(AppImages.cameraIcon),
        size: Sizes.iconsSizes['s7'],
        color: AppColors.grey,
      ),
    );
  }
}
