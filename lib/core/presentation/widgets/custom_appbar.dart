import 'package:flutter/material.dart';

import '../routing/navigation_service.dart';
import '../styles/sizes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    this.title,
    this.centerTitle = false,
    this.hasBackButton = false,
    this.result,
    this.trailingActions,
    this.appBarPadding = EdgeInsets.zero,
    this.backgroundColor,
    this.statusBarColor,
    super.key,
  });

  final Widget? title;
  final bool centerTitle;
  final bool hasBackButton;
  final Object? result;
  final List<Widget>? trailingActions;
  final EdgeInsetsGeometry? appBarPadding;
  final Color? backgroundColor;
  final Color? statusBarColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
      // This is helpful for adding symmetric padding for the whole appbar.
      padding: appBarPadding,
      child: AppBar(
        leading: hasBackButton ? CustomBackButton(result: result) : null,
        leadingWidth: Sizes.appBarLeadingWidth,
        automaticallyImplyLeading: false,
        title: title,
        centerTitle: centerTitle,
        titleSpacing: 0,
        actions: trailingActions,
        backgroundColor: backgroundColor,
        systemOverlayStyle: Theme.of(context)
            .appBarTheme
            .systemOverlayStyle
            ?.copyWith(statusBarColor: statusBarColor),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    required this.result,
    super.key,
  });
  final dynamic result;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: BackButton(
        color: Theme.of(context).iconTheme.color,
        onPressed: () => NavigationService.pop(context, result: result),
      ),
    );
  }
}
