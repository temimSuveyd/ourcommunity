import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ourcommunity/controller/settings/settings_controller.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/routes.dart';
import 'package:ourcommunity/core/services/servieses.dart';
import 'core/binding/Biniding.dart';
import 'core/localization/apptranslation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initailservieses();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Place controller above the builder tree for reactivity.
    return GetBuilder<SettingsControllerImp>(
      init: SettingsControllerImp(),
      builder: (controller) {
        return ScreenUtilInit(
          designSize: MediaQuery.of(context).size.width > 600
              ? const Size(834, 1194)
              : const Size(393, 859),
          minTextAdapt: true,
          splitScreenMode: true,
          enableScaleWH: () => true,
          enableScaleText: () => true,
          builder: (context, child) {
            ScreenUtil.init(context);
            return GetMaterialApp(
              translations: AppTranslations(),
              locale: const Locale('en'), // اللغة الافتراضية
              fallbackLocale: const Locale('en'),
              debugShowCheckedModeBanner: false,
              initialBinding: InitialBinding(),
              theme: ThemeData(
                fontFamily: GoogleFonts.inter().fontFamily,
                scaffoldBackgroundColor: Appcolor.lighetThemeBackground,
              ),
              darkTheme: ThemeData(
                fontFamily: GoogleFonts.inter().fontFamily,
                scaffoldBackgroundColor: Appcolor.darkThemeBackground,
              ),
              themeMode: controller.isDarkMode == true ? ThemeMode.dark : ThemeMode.light,
              getPages: routes,
            );
          },
        );
      },
    );
  }
}
