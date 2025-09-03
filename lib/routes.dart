import 'package:get/get.dart';
import 'package:ourcommunity/screen/view/homepage.dart';
import 'package:ourcommunity/screen/view/onboarding_page.dart';
import 'package:ourcommunity/screen/view/openscreen.dart';
import 'package:ourcommunity/screen/view/auth/OTPVerificationPage.dart';
import 'package:ourcommunity/screen/view/auth/Resetpassword.dart';
import 'package:ourcommunity/screen/view/auth/forgetpassword_page.dart';
import 'package:ourcommunity/screen/view/auth/login_page.dart';
import 'package:ourcommunity/screen/view/auth/passwordChangeSuccessPage.dart';
// import 'package:ourcommunity/screen/view/auth/register_page.dart';
import 'package:ourcommunity/screen/view/welcomeback.dart';
import 'core/constant/Approutes.dart';
import 'screen/view/auth/register_page.dart';

List<GetPage> routes = [
  ////////////users
  //GetPage(name: Approutes.Testview, page: () => Testvi()),
  GetPage(
    name: "/",
    page: () => OpenScreen(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: Approutes.onboarding,
    page: () => Onboarding(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: Approutes.welcomeBackUI,
    page: () => WelcomeBackUI(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  ////////////////auth
  GetPage(
    name: Approutes.registerPage,
    page: () => RegisterPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: Approutes.loginPage,
    page: () => LoginPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: Approutes.forgetpasswordpage,
    page: () => ForgetPasswordPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: Approutes.respassword,
    page: () => ResetPasswordPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: Approutes.oTPVerificationPage,
    page: () => OTPVerificationPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: Approutes.passwordChangeSuccessPage,
    page: () => PasswordChangeSuccessPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),

  GetPage(
    name: Approutes.homePage,
    page: () => HomePage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
];
