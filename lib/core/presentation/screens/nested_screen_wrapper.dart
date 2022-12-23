import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_widget.dart';
import 'package:deliverzler/features/home_base/presentation/components/tab_appbar_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//This is necessary with nested navigation to prevent transparent background of nested screens when navigating
class NestedScreenWrapper extends StatelessWidget {
  const NestedScreenWrapper({
    required this.body,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.hasAppBar = true,
    Key? key,
  }) : super(key: key);

  final Widget body;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final bool hasAppBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: PlatformWidget(
        material: (_) {
          return body;
        },
        cupertino: (_) {
          return CupertinoPageScaffold(
            navigationBar: hasAppBar
                ? TabAppBarComponent(
                    toolbarHeight: Sizes.appBarHeight(context),
                    backgroundColor:
                        Theme.of(context).appBarTheme.backgroundColor,
                  )
                : null,
            backgroundColor:
                backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            child: body,
          );
        },
      ),
    );
  }
}
