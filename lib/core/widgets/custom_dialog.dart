import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_button.dart';
import 'package:deliverzler/core/widgets/custom_image.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomDialog extends AlertDialog {
  CustomDialog(
    BuildContext context, {
    Key? key,
    double? width,
    double? height,
    String? image,
    Function? onPressed,
    Function? onPressed2,
    String? title,
    Widget? action,
    String? buttonText,
    String? buttonText2,
    EdgeInsetsGeometry? titlePadding,
    TextStyle? titleTextStyle,
    String description = '',
    Widget? footer,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? contentTextStyle,
    List<Widget>? actions,
    EdgeInsetsGeometry? actionsPadding,
    VerticalDirection? actionsOverflowDirection,
    EdgeInsetsGeometry? buttonPadding,
    Color? backgroundColor,
    double? elevation,
    String? semanticLabel,
    EdgeInsets? insetPadding,
    Clip clipBehavior = Clip.none,
    ShapeBorder? shape,
    bool scrollable = false,
    Widget? child,
  }) : super(
          key: key,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: shape,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                vertical: Sizes.dialogVPadding(context),
                horizontal: Sizes.dialogHPadding(context),
              ),
          // insetPadding: child != null ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: Sizes.widthDialogMessage),
          content: child ??
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (image != null)
                    CustomImage.s2(
                      context,
                      image,
                      color: const Color(0xffcca76a),
                    ),
                  SizedBox(
                    height: Sizes.vMarginSmall(context),
                  ),
                  CustomText.h3(
                    context,
                    title ?? '',
                    textAlign: TextAlign.center,
                    weight: FontStyles.fontWeightBold,
                    alignment: Alignment.center,
                  ),
                  if (description.isNotEmpty)
                    CustomText.h4(
                      context,
                      description,
                      textAlign: TextAlign.center,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        top: Sizes.vMarginComment(context),
                      ),
                    ),
                  SizedBox(
                    height: Sizes.vMarginMedium(context),
                  ),
                  CustomButton(
                    text: buttonText ?? "",
                    onPressed: () {
                      if (onPressed != null) onPressed();
                    },
                    height: Sizes.roundedButtonDialogHeight(context),
                    width: Sizes.roundedButtonDialogWidth(context),
                  ),
                  if (buttonText2 != null)
                    CustomButton(
                      text: buttonText2,
                      onPressed: () {
                        if (onPressed2 != null) onPressed2();
                      },
                      height: Sizes.roundedButtonDialogHeight(context),
                      width: Sizes.roundedButtonDialogWidth(context),
                    ),
                  if (footer != null) footer,
                ],
              ),
        );
}
