import 'package:flutter/material.dart';

import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/styles/styles.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';

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
          Text(
            '${tr(context).reasonForCancelingTheOrder}:',
            style: TextStyles.f16(context),
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
