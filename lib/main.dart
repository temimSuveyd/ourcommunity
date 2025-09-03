import 'dart:developer';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ourcommunity/routes.dart';
import 'package:ourcommunity/services/servieses.dart';
import 'binding/Biniding.dart';
import 'localization/apptranslation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   await FirebaseAppCheck.instance.activate(androidProvider: AndroidProvider.debug);
FirebaseAuth.instance.setLanguageCode('ar');
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
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            translations: AppTranslations(),
            locale: const Locale('en'), // اللغة الافتراضية
            fallbackLocale: const Locale('en'),
            debugShowCheckedModeBanner: false,
            initialBinding: InitialBinding(),
            getPages: routes,
          );
        });
  }
}
