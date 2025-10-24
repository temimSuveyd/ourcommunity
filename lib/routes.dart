import 'package:get/get.dart';
import 'package:ourcommunity/core/Middle_ware/app_middle_ware.dart';
import 'package:ourcommunity/screen/view/homepage/createeventpage.dart';
import 'package:ourcommunity/screen/view/homepage/homepage.dart';
import 'package:ourcommunity/screen/view/onboarding_page.dart';
import 'package:ourcommunity/screen/view/openscreen.dart';
import 'package:ourcommunity/screen/view/auth/email_waiting_page.dart';
import 'package:ourcommunity/screen/view/auth/Resetpassword.dart';
import 'package:ourcommunity/screen/view/auth/forgetpassword_page.dart';
import 'package:ourcommunity/screen/view/auth/login_page.dart';
import 'package:ourcommunity/screen/view/auth/passwordChangeSuccessPage.dart';
// import 'package:ourcommunity/screen/view/auth/register_page.dart';
import 'package:ourcommunity/screen/view/welcomeback.dart';
import 'core/constant/Approutes.dart';
import 'screen/view/auth/register_page.dart';

List<GetPage> routes = [
  GetPage(
    name: "/",
    page: () => HomePage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
    // middlewares: [AppMiddleware()],
  ),
  GetPage(
    name: AppRoutes.onboarding,
    page: () => Onboarding(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: AppRoutes.welcomeBackUI,
    page: () => WelcomeBackUI(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  ////////////////auth
  GetPage(
    name: AppRoutes.registerPage,
    page: () => RegisterPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: AppRoutes.loginPage,
    page: () => LoginPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: AppRoutes.forgetpasswordpage,
    page: () => ForgetPasswordPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: AppRoutes.respassword,
    page: () => ResetPasswordPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: AppRoutes.emailWaitingPage,
    page: () => EmailWaitingPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: AppRoutes.passwordChangeSuccessPage,
    page: () => PasswordChangeSuccessPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),

  GetPage(
    name: AppRoutes.emailWaitingPage,
    page: () => EmailWaitingPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),

  GetPage(
    name: AppRoutes.homePage,
    page: () => HomePage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
    GetPage(
    name: AppRoutes.createEventPage,
    page: () => CreateEventPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
];
