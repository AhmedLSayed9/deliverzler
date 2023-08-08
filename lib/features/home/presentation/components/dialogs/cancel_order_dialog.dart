import 'package:flutter/material.dart';

import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/styles/styles.dart';

class CancelOrderDialog extends StatelessWidget {
  const CancelOrderDialog({required this.cancelNoteController, super.key});

  final TextEditingController cancelNoteController;

  @override
  Widget build(BuildContext context) {
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
