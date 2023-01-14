import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import 'package:deliverzler/features/home/presentation/components/dialogs/cancel_order_note_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_button.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';

class CancelOrderDialog extends HookWidget {
  const CancelOrderDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cancelNoteController = useTextEditingController(text: '');

    return SizedBox(
      width: Sizes.dialogWidth280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText.f16(
            context,
            '${tr(context).reasonForCancelingTheOrder}:',
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          CancelOrderNoteComponent(
            cancelNoteController: cancelNoteController,
          ),
          const SizedBox(
            height: Sizes.marginV20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.paddingH8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: CustomButton(
                    buttonColor: customColors(context).greyColor,
                    height: Sizes.buttonHeight44,
                    width: Sizes.buttonWidth120,
                    onPressed: () {
                      NavigationService.goBack(context);
                    },
                    child: CustomText.f16(
                      context,
                      tr(context).cancel,
                      color: const Color(0xffffffff),
                      weight: FontStyles.fontWeightSemiBold,
                      //alignment: Alignment.center,
                    ),
                  ),
                ),
                Flexible(
                  child: CustomButton(
                    text: tr(context).confirm,
                    height: Sizes.buttonHeight44,
                    width: Sizes.buttonWidth120,
                    onPressed: () {
                      NavigationService.goBack(
                        context,
                        result: [cancelNoteController.text],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
