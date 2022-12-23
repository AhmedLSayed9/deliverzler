import 'package:flutter/material.dart';

import '../../core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../helpers/localization_helper.dart';
import '../styles/app_images.dart';
import '../styles/sizes.dart';
import '../widgets/custom_text.dart';

class ImagePickComponent extends StatelessWidget {
  const ImagePickComponent({
    required this.pickFromCameraCallBack,
    required this.pickFromGalleryCallBack,
    Key? key,
  }) : super(key: key);

  final void Function(BuildContext ctx)? pickFromCameraCallBack;
  final void Function(BuildContext ctx)? pickFromGalleryCallBack;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.paddingV8,
        horizontal: Sizes.paddingH8,
      ),
      constraints: const BoxConstraints(),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
        showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: CustomText.f18(
                ctx,
                tr(ctx).chooseOption,
                color: Colors.blue,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(
                    height: 1,
                  ),
                  Material(
                    color: Theme.of(ctx).primaryColor,
                    child: ListTile(
                      onTap: pickFromCameraCallBack == null
                          ? null
                          : () => pickFromCameraCallBack!(ctx),
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
                    color: Theme.of(ctx).primaryColor,
                    child: ListTile(
                      onTap: pickFromGalleryCallBack == null
                          ? null
                          : () => pickFromGalleryCallBack!(ctx),
                      title: CustomText.f18(
                        ctx,
                        tr(ctx).gallery,
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
        size: Sizes.icon12,
        color: customColors(context).greyColor,
      ),
    );
  }
}
