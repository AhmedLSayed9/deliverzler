import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_base_widget.dart';

class PlatformSwitch extends PlatformBaseWidget<Switch, CupertinoSwitch> {
  const PlatformSwitch({
    super.key,
    this.widgetKey,
    required this.value,
    required this.onChanged,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.thumbColor,
    this.materialData,
    this.cupertinoData,
  });

  final Key? widgetKey;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? thumbColor;
  final MaterialSwitchData? materialData;
  final CupertinoSwitchData? cupertinoData;

  @override
  Switch createMaterialWidget(BuildContext context) {
    return Switch(
      key: widgetKey,
      value: value,
      onChanged: onChanged,
      activeTrackColor: activeTrackColor,
      inactiveTrackColor: inactiveTrackColor,
      activeColor: thumbColor,
      inactiveThumbColor: materialData?.inactiveThumbColor ?? thumbColor,
    );
  }

  @override
  CupertinoSwitch createCupertinoWidget(BuildContext context) {
    return CupertinoSwitch(
      key: widgetKey,
      value: value,
      onChanged: onChanged,
      activeColor: activeTrackColor,
      trackColor: inactiveTrackColor,
      thumbColor: thumbColor,
    );
  }
}

class MaterialSwitchData {
  const MaterialSwitchData({
    this.inactiveThumbColor,
  });

  final Color? inactiveThumbColor;
}

class CupertinoSwitchData {
  const CupertinoSwitchData();
}
