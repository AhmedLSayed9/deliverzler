import 'package:deliverzler/core/presentation/services/responsive_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<ResponsiveService>(ResponsiveService());
}
