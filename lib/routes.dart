import 'package:get/get.dart';
import 'package:ourcommunity/core/Middle_ware/app_middle_ware.dart';
import 'package:ourcommunity/view/pages/Group_Invitations_Page/Group_Invitations_view_page.dart';
import 'package:ourcommunity/view/pages/event/create_event_page.dart';
import 'package:ourcommunity/view/pages/all_users/all_users_view_page.dart';
import 'package:ourcommunity/view/pages/event/my_events.dart';
import 'package:ourcommunity/view/pages/openscreen.dart';
import 'package:ourcommunity/view/pages/profile/edit_profile_page.dart';
import 'package:ourcommunity/view/pages/profile/verify_Identity_Page.dart';
import 'package:ourcommunity/view/pages/settings/settingpage.dart';
import 'package:ourcommunity/view/pages/team/edit_team_info_page.dart';
import 'package:ourcommunity/view/pages/event/event_details_page.dart';
import 'package:ourcommunity/view/pages/homepage/home_page.dart';
import 'package:ourcommunity/view/pages/team/invite_member_page.dart';
import 'package:ourcommunity/view/pages/team/view_team_page.dart';
import 'package:ourcommunity/view/pages/onboarding_page.dart';
import 'package:ourcommunity/view/pages/auth/reset_password.dart';
import 'package:ourcommunity/view/pages/auth/forget_password_page.dart';
import 'package:ourcommunity/view/pages/auth/login_page.dart';
import 'package:ourcommunity/view/pages/auth/password_change_success_page.dart';
import 'package:ourcommunity/view/pages/team/create_team_page.dart';
import 'package:ourcommunity/view/pages/welcomeback.dart';
import 'core/constant/Approutes.dart';
import 'view/pages/auth/register_page.dart';

List<GetPage> routes = [
  GetPage(
    name: "/",
    page: () => OpenScreen(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
    middlewares: [AppMiddleware()],
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
    name: AppRoutes.passwordChangeSuccessPage,
    page: () => PasswordChangeSuccessPage(),
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
  GetPage(
    name: AppRoutes.eventDetailsPage,
    page: () => EventDetailsPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: AppRoutes.createTeamPage,
    page: () => CreateTeamPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),

  GetPage(
    name: AppRoutes.quraaAldasmaPage,
    page: () => TeamViewPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),

  GetPage(
    name: AppRoutes.inviteMemberPage,
    page: () => InviteMemberPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: AppRoutes.allUsersViewPage,
    page: () => AllUsersViewPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: AppRoutes.editTeamInfoPage,
    page: () => EditTeamInfoPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: AppRoutes.editProfilePage,
    page: () => EditProfilePage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: AppRoutes.myEventsPage,
    page: () => MyEventsPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),

  GetPage(
    name: AppRoutes.settingsPage,
    page: () => SettingsPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 300),
  ),
];
