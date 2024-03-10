import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import 'app.dart';
import 'core/infrastructure/local/shared_preferences_facade.dart';
import 'core/presentation/extensions/future_extensions.dart';
import 'core/presentation/providers/device_info_providers.dart';
import 'core/presentation/providers/provider_observers.dart';
import 'core/presentation/screens/splash_screen/splash_screen.dart';
import 'core/presentation/utils/riverpod_framework.dart';
import 'firebase_options.dart';

part 'core/infrastructure/services/main_initializer.dart';

void main() async {
  final container = await _mainInitializer();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}
