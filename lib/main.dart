import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ourcommunity/routes.dart';
import 'package:ourcommunity/screen/view/auth/register_page.dart';
import 'package:ourcommunity/services/servieses.dart';
import 'binding/Biniding.dart';
import 'localization/apptranslation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initailservieses();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: MediaQuery.of(context).size.width > 600
            ? const Size(834, 1194) // Adjust for tablets
            : const Size(393, 859), // Phone dimensions
        minTextAdapt: true,
        splitScreenMode: true,
        enableScaleWH: () => true,
        enableScaleText: () => true,

        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (context, child) {
          ScreenUtil.init(context);
          return GetMaterialApp(
            title: 'Flutter Demo',
            translations: AppTranslations(),
            locale: const Locale('en'), // اللغة الافتراضية
            fallbackLocale: const Locale('en'),
            debugShowCheckedModeBanner: false,
            initialBinding: InitialBinding(),
            theme: ThemeData(fontFamily: GoogleFonts.inter().fontFamily),
            getPages: routes,
          );
        });
  }
}
