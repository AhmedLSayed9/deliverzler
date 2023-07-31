part of 'styles.dart';

abstract class TextStyles {
  // This is necessary for smooth fontFamily changes when changing app language,
  // that's because the fontFamily change from the theme have a slight delay.
  static TextStyle _mainStyle(BuildContext context) => TextStyle(
        fontFamily: tr(context).fontFamily,
      );

  static TextStyle f28(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).font28Color,
        fontSize: Sizes.font28,
        fontWeight: FontStyles.fontWeightBlack,
      );

  static TextStyle f20(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).font20Color,
        fontSize: Sizes.font20,
        fontWeight: FontStyles.fontWeightBlack,
      );

  static TextStyle f18(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).font18Color,
        fontSize: Sizes.font18,
      );

  static TextStyle f18SemiBold(BuildContext context) =>
      f18(context).copyWith(fontWeight: FontStyles.fontWeightSemiBold);

  static TextStyle f16(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).font16Color,
        fontSize: Sizes.font16,
      );

  static TextStyle f16SemiBold(BuildContext context) =>
      f16(context).copyWith(fontWeight: FontStyles.fontWeightSemiBold);

  static TextStyle f14(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).font14Color,
        fontSize: Sizes.font14,
      );

  static TextStyle f12(BuildContext context) => _mainStyle(context).copyWith(
        color: customColors(context).font12Color,
        fontSize: Sizes.font12,
      );

  static TextStyle titleMedium(Color color) => TextStyle(color: color, fontSize: Sizes.font14);

  static TextStyle inputDecorationHint(Color color) =>
      TextStyle(color: color, fontSize: Sizes.font12);

  static TextStyle inputDecorationError(Color color) =>
      TextStyle(color: color, fontSize: Sizes.font12);

  static TextStyle navigationLabel(Color color) => TextStyle(color: color, fontSize: Sizes.font12);

  static TextStyle coloredElevatedButton(BuildContext context) => f16(context).copyWith(
        color: const Color(0xffffffff),
        fontWeight: FontStyles.fontWeightSemiBold,
      );

  static TextStyle dialogTitle(Color color) => TextStyle(
        color: color,
        fontSize: Sizes.font18,
        fontWeight: FontStyles.fontWeightBold,
      );

  static TextStyle dialogContent(Color color) => TextStyle(color: color, fontSize: Sizes.font16);

  static TextStyle cupertinoDialogAction(BuildContext context) => f16SemiBold(context);
}
