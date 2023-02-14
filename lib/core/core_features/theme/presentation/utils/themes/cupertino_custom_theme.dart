import 'package:flutter/material.dart';

import '../../../../../presentation/styles/sizes.dart';

abstract class CupertinoCustomTheme {
  static BoxDecoration cupertinoFormSectionDecoration(BuildContext context) =>
      BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            Sizes.textFieldR12,
          ),
        ),
        border: Border.all(
          color:
              Theme.of(context).inputDecorationTheme.border!.borderSide.color,
        ),
      );
}
