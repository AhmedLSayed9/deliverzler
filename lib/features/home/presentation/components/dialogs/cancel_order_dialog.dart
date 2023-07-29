import 'package:flutter/material.dart';

import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/styles/sizes.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../../core/presentation/widgets/custom_text.dart';

class CancelOrderDialog extends HookWidget {
  const CancelOrderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final cancelNoteController = useTextEditingController(text: '');

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: Sizes.dialogWidth280,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.f16(
            context,
            '${tr(context).reasonForCancelingTheOrder}:',
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          Material(
            color: Colors.transparent,
            child: TextFormField(
              key: const ValueKey('cancel_note'),
              controller: cancelNoteController,
              decoration: InputDecoration(
                filled: false,
                hintText: '${tr(context).typeYourNote}...',
              ),
              textInputAction: TextInputAction.newline,
              minLines: 1,
              maxLines: 6,
              maxLength: 200,
            ),
          ),
        ],
      ),
    );
  }
}
