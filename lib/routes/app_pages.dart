import 'package:get/get.dart';
import 'package:riseup_assignment/modules/signup/signup_binding.dart';
import '../helper/internet_checker_helper/internet_checker_helper_binding.dart';
import '../modules/dashboard/dashboard_binding.dart';
import '../modules/dashboard/dashboard_view.dart';
import '../modules/signin/signin_binding.dart';
import '../modules/signin/signin_view.dart';
import '../modules/signup/signup_view.dart';
import '../modules/spalsh/splash_binding.dart';
import '../modules/spalsh/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      //binding: SplashBinding(),
      bindings: [
        SplashBinding(),
        InternetCheckerHelperBinding(),
      ]
    ),

    GetPage(
        name: Routes.LOGIN,
        page: () => SigninPage(),
        //binding: SplashBinding(),
        bindings: [
          SigninBinding(),
          InternetCheckerHelperBinding(),
        ]
    ),

    GetPage(
        name: Routes.SIGNUP,
        page: () => SignupPage(),
        //binding: SplashBinding(),
        bindings: [
          SignupBinding(),
          InternetCheckerHelperBinding(),
        ]
    ),


    GetPage(
        name: Routes.DASHBOARD,
        page: () => DashboardPage(),
        //binding: SplashBinding(),
        bindings: [
          DashboardBinding(),
          InternetCheckerHelperBinding(),
        ]
    ),
  ];
}



// GetPage(
//     name: Routes.HOME,
//     page: () => HomeScreen(),
//     binding: HomeBinding(),
//     children: [
//       GetPage(name: Routes.CARDS, page: () => CardsScreen()),
//     ]),


// static const FAVOURITES = '/favourites';
// static const ORDERS = '/orders';
// static const REPORT = '/report';
// static const INVITE_FRIEND = '/invite_friend';
// static const TALK_TO_MANAGEMENT = '/talk_to_management';