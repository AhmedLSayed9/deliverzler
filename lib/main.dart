import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import 'app.dart';
import 'core/presentation/extensions/future_extensions.dart';
import 'core/presentation/providers/device_info_providers.dart';
import 'core/presentation/providers/provider_observers.dart';
import 'core/presentation/utils/riverpod_framework.dart';
import 'firebase_options.dart';
import 'gen/my_assets.dart';

part 'core/presentation/services/main_initializer.dart';

void main() async {
  final container = ProviderContainer();
  await _mainInitializer(container);
  runApp(
    ProviderScope(
      parent: container,
      observers: [ProviderLogger(), ProviderCrashlytics()],
      child: const MyApp(),
    ),
  );
}
