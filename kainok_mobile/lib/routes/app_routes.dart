import 'package:get/get.dart';
import 'package:kainok_app/presentation/category_listing_screen/binding/category_listing_binding.dart';
import 'package:kainok_app/presentation/category_listing_screen/category_listing_screen.dart';
import 'package:kainok_app/presentation/comp_image_listing_screen/image_listing_screen.dart';
import 'package:kainok_app/presentation/global_comp_screen/binding/global_comp_screen_binding.dart';
import 'package:kainok_app/presentation/global_comp_screen/global_comp_screen_page.dart';
import 'package:kainok_app/presentation/participate_in_comp_screen/binding/participate_in_comp_binding.dart';
import 'package:kainok_app/presentation/participate_in_comp_screen/participate_in_comp_screen.dart';
import 'package:kainok_app/presentation/voting_screen_page/binding/voting_screen_binding.dart';
import 'package:kainok_app/presentation/voting_screen_page/voting_screen_page.dart';
import 'package:kainok_app/presentation/login_using_finger_print_screen/login_using_finger_print_screen.dart';
import 'package:kainok_app/presentation/profile_deatils_my_participation_tab_container_screen/profile_deatils_my_participation_tab_container_screen.dart';
import 'package:kainok_app/presentation/sign_in_screen/binding/sign_in_binding.dart';
import 'package:kainok_app/presentation/sign_in_screen/sign_in_screen.dart';

import 'package:kainok_app/presentation/action_sheet_one_screen/action_sheet_one_screen.dart';
import 'package:kainok_app/presentation/action_sheet_one_screen/binding/action_sheet_one_binding.dart';
import 'package:kainok_app/presentation/action_sheet_screen/action_sheet_screen.dart';
import 'package:kainok_app/presentation/action_sheet_screen/binding/action_sheet_binding.dart';
import 'package:kainok_app/presentation/admin_dashboard_screen/admin_dashboard_screen.dart';
import 'package:kainok_app/presentation/admin_dashboard_screen/binding/admin_dashboard_binding.dart';
import 'package:kainok_app/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:kainok_app/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:kainok_app/presentation/competitions_screen_page/binding/competitions_screen_binding.dart';
import 'package:kainok_app/presentation/competitions_screen_page/competitions_screen_page.dart';
import 'package:kainok_app/presentation/create_account_screen/binding/create_account_binding.dart';
import 'package:kainok_app/presentation/create_account_screen/create_account_screen.dart';
import 'package:kainok_app/presentation/create_edit_user_one_screen/binding/create_edit_user_one_binding.dart';
import 'package:kainok_app/presentation/create_edit_user_one_screen/create_edit_user_one_screen.dart';
import 'package:kainok_app/presentation/create_edit_user_screen/binding/create_edit_user_binding.dart';
import 'package:kainok_app/presentation/create_edit_user_screen/create_edit_user_screen.dart';
import 'package:kainok_app/presentation/delete_user_screen/binding/delete_user_binding.dart';
import 'package:kainok_app/presentation/delete_user_screen/delete_user_screen.dart';
import 'package:kainok_app/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import 'package:kainok_app/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:kainok_app/presentation/edit_user_profile_screen/binding/edit_user_profile_binding.dart';
import 'package:kainok_app/presentation/edit_user_profile_screen/edit_user_profile_screen.dart';
import 'package:kainok_app/presentation/enter_mobile_number_one_screen/binding/enter_mobile_number_one_binding.dart';
import 'package:kainok_app/presentation/enter_mobile_number_one_screen/enter_mobile_number_one_screen.dart';
import 'package:kainok_app/presentation/enter_otp_screen/binding/enter_mobile_number_binding.dart';
import 'package:kainok_app/presentation/enter_otp_screen/enter_otp_screen.dart';
import 'package:kainok_app/presentation/finger_print_login_screen/binding/finger_print_binding.dart';
import 'package:kainok_app/presentation/finger_print_login_screen/finger_print_login_screen.dart';
import 'package:kainok_app/presentation/forgot_password_otp_verification_screen/binding/forgot_password_otp_verification_binding.dart';
import 'package:kainok_app/presentation/forgot_password_otp_verification_screen/forgot_password_otp_verification_screen.dart';
import 'package:kainok_app/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:kainok_app/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:kainok_app/presentation/image_details_screen_container_screen/binding/image_details_screen_container_binding.dart';
import 'package:kainok_app/presentation/image_details_screen_container_screen/image_details_screen_container_screen.dart';
import 'package:kainok_app/presentation/comp_image_listing_screen/binding/image_listing_binding.dart';
import 'package:kainok_app/presentation/log_in_screen/binding/log_in_binding.dart';
import 'package:kainok_app/presentation/log_in_screen/log_in_screen.dart';
import 'package:kainok_app/presentation/login_using_finger_print_screen/binding/login_using_finger_print_binding.dart';
import 'package:kainok_app/presentation/my_comp_img_listing_screen/binding/my_comp_img_listing_binding.dart';
import 'package:kainok_app/presentation/my_comp_img_listing_screen/my_comp_img_listing_screen.dart';
import 'package:kainok_app/presentation/my_vote_img_listing_screen/binding/my_vote_img_listing_binding.dart';
import 'package:kainok_app/presentation/my_vote_img_listing_screen/my_vote_img_listing_screen.dart';
import 'package:kainok_app/presentation/navigation_screen/binding/navigation_binding.dart';
import 'package:kainok_app/presentation/navigation_screen/navigation_screen.dart';
import 'package:kainok_app/presentation/new_password_screen/binding/new_password_binding.dart';
import 'package:kainok_app/presentation/new_password_screen/new_password_screen.dart';
import 'package:kainok_app/presentation/password_updated_screen/binding/password_updated_binding.dart';
import 'package:kainok_app/presentation/password_updated_screen/password_updated_screen.dart';
import 'package:kainok_app/presentation/preview_fullscreen_screen/binding/preview_fullscreen_binding.dart';
import 'package:kainok_app/presentation/preview_fullscreen_screen/preview_fullscreen_screen.dart';
import 'package:kainok_app/presentation/preview_screen/binding/preview_binding.dart';
import 'package:kainok_app/presentation/preview_screen/preview_screen.dart';
import 'package:kainok_app/presentation/profile_deatils_my_participation_tab_container_screen/binding/profile_deatils_my_participation_tab_container_binding.dart';
import 'package:kainok_app/presentation/sign_up_guest_user_screen/binding/signup_guest_user_binding.dart';
import 'package:kainok_app/presentation/sign_up_guest_user_screen/signup_guest_user_screen.dart';
import 'package:kainok_app/presentation/splash_screen/binding/splash_binding.dart';
import 'package:kainok_app/presentation/splash_screen/splash_screen.dart';
import 'package:kainok_app/presentation/upload_competition_screen/binding/upload_competition_binding.dart';
import 'package:kainok_app/presentation/upload_competition_screen/upload_competition_screen.dart';
import 'package:kainok_app/presentation/upload_your_entry_screen/binding/upload_your_entry_binding.dart';
import 'package:kainok_app/presentation/upload_your_entry_screen/upload_your_entry_screen.dart';
import 'package:kainok_app/presentation/user_management_screen/binding/user_management_binding.dart';
import 'package:kainok_app/presentation/user_management_screen/user_management_screen.dart';
import 'package:kainok_app/presentation/winner_container_screen/binding/winner_container_binding.dart';
import 'package:kainok_app/presentation/winner_container_screen/winner_container_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String myCompImgListingScreen = '/my_comp_img_listing_screen';
  static const String myVotesImgListingScreen = '/my_vote_img_listing_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String actionSheetOneScreen = '/action_sheet_one_screen';

  static const String enterMobileNumberOneScreen =
      '/enter_mobile_number_one_screen';

  static const String navigationScreen = '/navigation_screen';

  static const String logInScreen = '/login_screen';

  static const String createAccountScreen = '/create_account_screen';

  static const String signUpGuestUserScreen = '/sign_up_guest_user_screen';

  static const String enterMobileNumberScreen =
      '/enter_mobile_number_one_screen';

  static const String enterOtpScreen = '/enter_mobile_number_screen';

  static const String votingScreenPage = '/image_details_screen_page';

  static const String competitionsScreen = '/competitions_screen_page';

  static const String globalCompScreen = '/global_comp_screen_page';

  static const String imageDetailsScreenContainerScreen =
      '/image_details_screen_container_screen';

  static const String competitionListScreen = '/category_listing_screen';

  static const String previewScreen = '/preview_screen';

  static const String previewFullscreenScreen = '/preview_fullscreen_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String forgotPasswordOtpVerificationScreen =
      '/forgot_password_otp_verification_screen';

  static const String imageUploadScreen = '/upload_your_entry_screen';

  static const String createCompetitionScreen = '/upload_competition_screen';

  static const String winnerContainerScreen = '/winner_container_screen';

  static const String voteScreen = '/vote_screen';

  static const String compImageListingScreen = '/comp_image_listing_screen';
  static const String participateInCompScreen = '/participate_in_comp_screen';

  static const String profileDeatilsMyVotePage =
      '/profile_deatils_my_vote_page';

  static const String profileDeatilsMyWinningsPage =
      '/profile_deatils_my_winnings_page';

  static const String profileDeatilsMyParticipationPage =
      '/profile_deatils_my_participation_page';

  static const String profileDeatilsMyParticipationTabContainerScreen =
      '/profile_deatils_my_participation_tab_container_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String fingerPrintScreen = '/finger_print_login_screen';

  static const String loginFingerPrintScreen =
      '/login_using_finger_print_screen';

  static const String adminDashboardScreen = '/admin_dashboard_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String editUserProfileScreen = '/edit_user_profile_screen';

  static const String deleteUserScreen = '/delete_user_screen';

  static const String createEditUserScreen = '/create_edit_user_screen';

  static const String voteSettingsScreen = '/create_edit_user_one_screen';

  static const String actionSheetScreen = '/action_sheet_screen';

  static const String newPasswordScreen = '/new_password_screen';

  static const String passwordUpdatedScreen = '/password_updated_screen';

  static const String userManagementScreen = '/user_management_screen';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: competitionListScreen,
      page: () => CategoryListingScreen(),
      bindings: [
        CategoryListingBinding(),
      ],
    ),

    GetPage(
      name: userManagementScreen,
      page: () => UserManagementScreen(),
      bindings: [
        UserManagementBinding(),
      ],
    ),
    GetPage(
      name: myCompImgListingScreen,
      page: () => MyCompImgListingScreen(),
      bindings: [
        MyCompImgListingBinding(),
      ],
    ),
    GetPage(
      name: myVotesImgListingScreen,
      page: () => MyVoteImgListingScreen(),
      bindings: [
        MyVoteImgListingBinding(),
      ],
    ),
    GetPage(
      name: passwordUpdatedScreen,
      page: () => PasswordUpdatedScreen(),
      bindings: [
        PasswordUpdatedBinding(),
      ],
    ),
    GetPage(
      name: newPasswordScreen,
      page: () => NewPasswordScreen(),
      bindings: [
        NewPasswordBinding(),
      ],
    ),
    GetPage(
      name: voteSettingsScreen,
      page: () => CreateEditUserOneScreen(),
      bindings: [
        CreateEditUserOneBinding(),
      ],
    ),
    GetPage(
      name: actionSheetScreen,
      page: () => ActionSheetScreen(),
      bindings: [
        ActionSheetBinding(),
      ],
    ),
    GetPage(
      name: compImageListingScreen,
      page: () => ImageListingScreen(),
      bindings: [
        ImageListingBinding(),
      ],
    ),
    GetPage(
      name: participateInCompScreen,
      page: () => ParticipateInCompetitionScreen(),
      bindings: [
        ParticipateInCompetitionBinding(),
      ],
    ),
    GetPage(
      name: createEditUserScreen,
      page: () => CreateEditUserScreen(),
      bindings: [
        CreateEditUserBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordOtpVerificationScreen,
      page: () => ForgotPasswordOtpVerificationScreen(),
      bindings: [
        ForgotPasswordOtpVerificationBinding(),
      ],
    ),
    GetPage(
      name: actionSheetOneScreen,
      page: () => ActionSheetOneScreen(),
      bindings: [
        ActionSheetOneBinding(),
      ],
    ),
    GetPage(
      name: enterMobileNumberOneScreen,
      page: () => EnterMobileNumberOneScreen(),
      bindings: [
        EnterMobileNumberOneBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: deleteUserScreen,
      page: () => DeleteUserScreen(),
      bindings: [
        DeleteUserBinding(),
      ],
    ),
    GetPage(
      name: navigationScreen,
      page: () => NavigationScreen(),
      bindings: [
        NavigationBinding(),
      ],
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),

    GetPage(
      name: editUserProfileScreen,
      page: () => EditUserProfileScreen(),
      bindings: [
        EditUserProfileBinding(),
      ],
    ),
    GetPage(
      name: logInScreen,
      page: () => LogInScreen(),
      bindings: [
        LogInBinding(),
      ],
    ),
    GetPage(
      name: createAccountScreen,
      page: () => CreateAccountScreen(),
      bindings: [
        CreateAccountBinding(),
      ],
    ),
    GetPage(
      name: enterMobileNumberScreen,
      page: () => EnterMobileNumberOneScreen(),
      bindings: [
        EnterMobileNumberOneBinding(),
      ],
    ),
    GetPage(
      name: enterOtpScreen,
      page: () => EnterOtpScreen(),
      bindings: [
        EnterOtpBinding(),
      ],
    ),
    GetPage(
      name: imageDetailsScreenContainerScreen,
      page: () => ImageDetailsScreenContainerScreen(),
      bindings: [
        ImageDetailsScreenContainerBinding(),
      ],
    ),
    GetPage(
      name: votingScreenPage,
      page: () => VotingScreenPage(),
      bindings: [
        VotingScreenBinding(),
      ],
    ),
    GetPage(
      name: competitionsScreen,
      page: () => CompetitionsScreenPage(),
      bindings: [
        CompetitionsScreenBinding(),
      ],
    ),
    GetPage(
      name: globalCompScreen,
      page: () => GlobalCompScreen(),
      bindings: [
        GlobalCompScreenBinding(),
      ],
    ),
    GetPage(
      name: signUpGuestUserScreen,
      page: () => SignUpGuestUserScreen(),
      bindings: [
        SignUpGuestUserBinding(),
      ],
    ),
    GetPage(
      name: previewScreen,
      page: () => PreviewScreen(),
      bindings: [
        PreviewBinding(),
      ],
    ),
    GetPage(
      name: previewFullscreenScreen,
      page: () => PreviewFullscreenScreen(),
      bindings: [
        PreviewFullscreenBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: imageUploadScreen,
      page: () => UploadYourEntryScreen(),
      bindings: [
        UploadYourEntryBinding(),
      ],
    ),
    GetPage(
      name: createCompetitionScreen,
      page: () => UploadCompetitionScreen(),
      bindings: [
        UploadCompetitionBinding(),
      ],
      transition: Transition.downToUp,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: winnerContainerScreen,
      page: () => WinnerContainerScreen(),
      bindings: [
        WinnerContainerBinding(),
      ],
    ),
    // GetPage(
    //   name: profileDeatilsMyParticipationPage,
    //   page: () => ProfileDeatilsMyParticipationPage(),
    //   bindings: [
    //     ProfileDeatilsMyParticipationTabContainerBinding(),
    //   ],
    // ),
    GetPage(
      name: profileDeatilsMyParticipationTabContainerScreen,
      page: () => ProfileDeatilsMyParticipationTabContainerScreen(),
      bindings: [
        ProfileDeatilsMyParticipationTabContainerBinding(),
      ],
    ),

    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
      bindings: [
        SignInBinding(),
      ],
    ),
    GetPage(
      name: fingerPrintScreen,
      page: () => FingerPrintScreen(),
      bindings: [
        FingerPrintBinding(),
      ],
    ),
    GetPage(
      name: loginFingerPrintScreen,
      page: () => LoginFingerPrintScreen(),
      bindings: [
        LoginFingerPrintBinding(),
      ],
    ),
    GetPage(
      name: adminDashboardScreen,
      page: () => AdminDashboardScreen(),
      bindings: [
        AdminDashboardBinding(),
      ],
    ),
  ];
}
