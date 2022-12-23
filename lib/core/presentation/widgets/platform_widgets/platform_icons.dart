import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/helpers/platform_helper.dart';

abstract class PlatformIcons {
  static IconData get back =>
      PlatformHelper.isMaterialApp() ? Icons.arrow_back : CupertinoIcons.back;

  static IconData get add =>
      PlatformHelper.isMaterialApp() ? Icons.add : CupertinoIcons.add;

  static IconData get home =>
      PlatformHelper.isMaterialApp() ? Icons.home : CupertinoIcons.home;

  static IconData get mail =>
      PlatformHelper.isMaterialApp() ? Icons.mail : CupertinoIcons.mail;

  static IconData get password =>
      PlatformHelper.isMaterialApp() ? Icons.password : Icons.password;

  static IconData get accountCircleSolid => PlatformHelper.isMaterialApp()
      ? Icons.account_circle
      : CupertinoIcons.person_crop_circle_fill;

  static IconData get settingsSolid => PlatformHelper.isMaterialApp()
      ? Icons.settings
      : CupertinoIcons.settings_solid;

  static IconData get personSolid => PlatformHelper.isMaterialApp()
      ? Icons.person
      : CupertinoIcons.person_solid;

  static IconData get eyeSolid => PlatformHelper.isMaterialApp()
      ? Icons.visibility
      : CupertinoIcons.eye_solid;

  static IconData get eyeSlashSolid => PlatformHelper.isMaterialApp()
      ? Icons.visibility_off
      : CupertinoIcons.eye_slash_fill;

  static IconData get error => PlatformHelper.isMaterialApp()
      ? Icons.error
      : CupertinoIcons.exclamationmark_circle_fill;

  static IconData get checkMark =>
      PlatformHelper.isMaterialApp() ? Icons.check : CupertinoIcons.check_mark;
}
