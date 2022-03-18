import 'dart:io';

import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/styles/sizes.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar(
    BuildContext context, {
    Key? key,
    List<Widget> children = const [],
    double? height,
    Color? color = Colors.transparent,
    Color? backButtonColor,
    bool canPop = false,
    bool isSkippable = false,
    Widget? backButtonWidget,
    dynamic result,
    Function? skipBehaviour,
  })  : assert(!(isSkippable ^ (skipBehaviour != null))),
        super(
          key: key,
          preferredSize:
              Size.fromHeight(height ?? Sizes.appBarDefaultHeight(context)),
          child: Container(
            color: color,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: Sizes.appBarStatusBarHeight(context),
                  color: Colors.transparent,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: Sizes.hPaddingMedium(context),
                      left: Sizes.hPaddingMedium(context),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (canPop)
                          _backButton(
                            context,
                            backButtonColor,
                            result: result,
                            backButtonWidget: backButtonWidget,
                          ),
                        if (isSkippable)
                          _skipButton(
                            context,
                            skipBehaviour,
                          ),
                        ...children,
                        SizedBox(
                          width: Sizes.iconsSizes(context)['s4'],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

  CustomAppBar.transparent(
    BuildContext context, {
    Key? key,
    List<Widget> children = const [],
    double height = 60,
    Color? backButtonColor,
    bool canPop = true,
    dynamic result,
  }) : this(
          context,
          key: key,
          children: children,
          canPop: canPop,
          result: result,
          height: height,
          backButtonColor: backButtonColor,
        );

  CustomAppBar.skippable(
    BuildContext context, {
    Key? key,
    List<Widget> children = const [],
    double? height,
    Color? backButtonColor,
    required Function skipBehaviour,
    dynamic result,
  }) : this(
          context,
          key: key,
          children: children,
          isSkippable: true,
          result: result,
          height: height,
          skipBehaviour: skipBehaviour,
          backButtonColor: backButtonColor,
        );

  CustomAppBar.withMenu(
    BuildContext context, {
    Key? key,
    Iterable<Widget> children = const [],
    Size? preferredSize,
    Color? color,
    Color? backButtonColor,
    Color? menuButtonColor,
    dynamic result,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : this(
          context,
          key: key,
          color: color,
          backButtonColor: backButtonColor,
          result: result,
          children: [
            IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.menu_rounded,
                color: menuButtonColor ?? Colors.black,
              ),
              iconSize: Sizes.iconsSizes(context)['s4'],
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            ...children,
          ],
        );

  CustomAppBar.nameAppBar(BuildContext context,
      {Key? key,
      List<Widget> children = const [],
      double height = 50,
      Color? backButtonColor,
      bool canPop = false,
      Color? color,
      Color? menuButtonColor,
      dynamic result,
      void Function()? onFilterIconTapped,
      String? name,
      required GlobalKey<ScaffoldState> scaffoldKey})
      : this(
          context,
          key: key,
          children: [
            IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.menu_rounded,
                color: menuButtonColor ?? Colors.black,
              ),
              iconSize: Sizes.iconsSizes(context)['s4'],
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            SizedBox(
              width: Sizes.hMarginTiny(context),
            ),
            Expanded(
              child: CustomText.h4(
                context,
                name == null ? 'helloThere' : "${'hello'} $name",
                color: const Color(0xff333333),
                maxLines: 1,
                weight: FontStyles.fontWeightBold,
                alignment: Alignment.center,
              ),
            ),
            Row(
              children: [
                if (onFilterIconTapped != null)
                  IconButton(
                    onPressed: onFilterIconTapped,
                    icon: const Icon(
                      Icons.filter_alt_sharp,
                      color: Color(0xff333333),
                    ),
                    iconSize: Sizes.iconsSizes(context)['s5'],
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
              ],
            ),
          ],
          color: color ?? const Color(0xfff9f9f9),
          canPop: canPop,
          result: result,
          height: height,
          backButtonColor: backButtonColor ?? const Color(0xfff9f9f9),
        );

  CustomAppBar.title(
    BuildContext context, {
    bool canPop = false,
    required String title,
    Color? color,
    dynamic result,
    Key? key,
  }) : this(
          context,
          key: key,
          canPop: canPop,
          color: color ?? AppColors.lightThemePrimaryColor,
          result: result,
          children: [
            CustomText.h2(
              context,
              title,
              weight: FontStyles.fontWeightBold,
              color: AppColors.white,
              alignment: Alignment.center,
            ),
          ],
        );

  static Widget _backButton(
    BuildContext context,
    Color? backButtonColor, {
    dynamic result,
    Widget? backButtonWidget,
  }) {
    return IconButton(
      onPressed: () {
        NavigationService.goBack(result: result);
      },
      icon: backButtonWidget ??
          Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: backButtonColor,
          ),
      iconSize: Sizes.iconsSizes(context)['s4'],
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }

  static Widget _skipButton(BuildContext context, Function? skipBehaviour) {
    return GestureDetector(
      onTap: () {
        if (skipBehaviour != null) skipBehaviour();
      },
      child: CustomText.h2(
        context,
        'skip',
        weight: FontStyles.fontWeightMedium,
        alignment: Alignment.center,
      ),
    );
  }
}
