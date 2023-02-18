import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/functional.dart';
import '../../domain/entities/app_notification.dart';

part 'tapped_notification_provider.g.dart';

@Riverpod(keepAlive: true)
class TappedNotification extends _$TappedNotification with NotifierUpdate {
  @override
  Option<AppNotification> build() => const None();
}
