import 'package:equatable/equatable.dart';

class AppNotification extends Equatable {
  final String initialRoute;
  final String? route;
  final Map<String, dynamic>? data;

  const AppNotification({
    required this.initialRoute,
    this.route,
    this.data,
  });

  @override
  List<Object?> get props => [initialRoute, route, data];
}
