import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';
import 'package:deliverzler/core/presentation/styles/app_images.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';

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
        vertical: Sizes.paddingV10(context),
        horizontal: Sizes.paddingH10(context),
      ),
      constraints: const BoxConstraints(),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: CustomText.f20(
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
                  Material(
                    color: Theme.of(context).primaryColor,
                    child: ListTile(
                      onTap: () async {
                        pickFromCameraFunction();
                        NavigationService.goBack(context);
                      },
                      title: CustomText.f18(
                        context,
                        tr(context).camera,
                      ),
                      leading: const Icon(
                        Icons.camera,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  Material(
                    color: Theme.of(context).primaryColor,
                    child: ListTile(
                      onTap: () async {
                        pickFromGalleryFunction();
                        NavigationService.goBack(context);
                      },
                      title: CustomText.f18(
                        context,
                        tr(context).gallery,
                      ),
                      leading: const Icon(
                        Icons.account_box,
                        color: Colors.blue,
                      ),
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
        size: Sizes.icon14(context),
        color: customColors(context).greyColor,
      ),
    );
  }
}
