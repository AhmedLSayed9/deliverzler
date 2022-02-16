import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:deliverzler/core/localization/all_translation_keys.dart';
import 'package:deliverzler/core/services/init_services/services_initializer.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/app_themes.dart';
import 'package:deliverzler/core/utils/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List results = await ServiceInitializer.instance.initializeSettings();
  runApp(ProviderScope(
    child: MyApp(
      locale: results[0],
      theme: results[1],
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    required this.locale,
    required this.theme,
    Key? key,
  }) : super(key: key);

  final Locale locale;
  final ThemeMode theme;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return ScreenUtilInit(
        designSize: orientation == Orientation.portrait
            ? const Size(414, 895)
            : const Size(895, 414),
        minTextAdapt: true,
        builder: () => AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            // For both Android + iOS
            statusBarColor: Colors.transparent,
            // For apps with a light background:
            // For Android (dark icons)
            statusBarIconBrightness: Brightness.dark,
            // For iOS (daSliverAppBar'dateFormat'rk icons)
            statusBarBrightness: Brightness.light,
          ),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: GetMaterialApp(
              builder: (context, widget) {
                ScreenUtil.setContext(context);
                return widget!;
              },
              debugShowCheckedModeBanner: false,
              title: 'Deliverzler',
              color: AppColors.primaryColor,
              translations: LanguageTranslation(),
              locale: locale,
              fallbackLocale: const Locale('en'),
              themeMode: theme,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              initialRoute: RoutePaths.coreSplash,
              onGenerateRoute: AppRouter.generateRoute,
            ),
          ),
        ),
      );
    });
  }
}
