import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/core_features/theme/presentation/utils/themes/cupertino_custom_theme.dart';
import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../../core/presentation/widgets/custom_text_form_field.dart';
import '../../../../../core/presentation/widgets/platform_widgets/platform_widget.dart';

class CancelOrderNoteComponent extends ConsumerWidget {
  const CancelOrderNoteComponent({
    required this.cancelNoteController,
    Key? key,
  }) : super(key: key);

  final TextEditingController cancelNoteController;

  @override
  Widget build(BuildContext context, ref) {
    return PlatformWidget(
      material: (_) {
        return Column(
          children: _sharedItemComponent(context, ref),
        );
      },
      cupertino: (_) {
        return CupertinoFormSection.insetGrouped(
          decoration:
              CupertinoCustomTheme.cupertinoFormSectionDecoration(context),
          backgroundColor: Colors.transparent,
          margin: EdgeInsets.zero,
          children: _sharedItemComponent(context, ref),
        );
      },
    );
  }

  List<Widget> _sharedItemComponent(BuildContext context, WidgetRef ref) {
    return [
      CustomTextFormField(
        key: const ValueKey('cancel_note'),
        hintText: '${tr(context).typeYourNote}...',
        controller: cancelNoteController,
        textInputAction: TextInputAction.newline,
        maxLines: 6,
        maxLength: 200,
      ),
    ];
  }
}
