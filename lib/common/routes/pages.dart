import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/routes/names.dart';
import 'package:u_learning/common/values/constant.dart';
import 'package:u_learning/global.dart';
import 'package:u_learning/pages/main_pages/home_page/bloc/page_view_bloc.dart';
import 'package:u_learning/pages/main_pages/home_page/home.dart';
import 'package:u_learning/pages/main_pages/main_pages.dart';
import 'package:u_learning/pages/main_pages/profile_page/settings_page/settings.dart';
import 'package:u_learning/pages/sign-in/sign_in.dart';
import '../../pages/main_pages/bloc/main_pages_bloc.dart';
import '../../pages/main_pages/profile_page/achievement_page/achievement.dart';
import '../../pages/main_pages/profile_page/achievement_page/bloc/achievement_bloc.dart';
import '../../pages/main_pages/profile_page/learning_reminders_page/bloc/learning_reminders_bloc.dart';
import '../../pages/main_pages/profile_page/learning_reminders_page/learning.dart';
import '../../pages/main_pages/profile_page/love_page/bloc/love_bloc.dart';
import '../../pages/main_pages/profile_page/love_page/love.dart';
import '../../pages/main_pages/profile_page/payment details_page/bloc/payment_bloc.dart';
import '../../pages/main_pages/profile_page/payment details_page/payment.dart';
import '../../pages/main_pages/profile_page/settings_page/bloc/setting_bloc.dart';
import '../../pages/sign-in/bloc/sign_in_bloc.dart';
import '../../pages/sign-up/bloc/sign_up_bloc.dart';
import '../../pages/sign-up/sign_up.dart';
import '../../pages/welcome/bloc/welcome_bloc.dart';
import '../../pages/welcome/welcome.dart';

class PageEntity {
  final String route;
  final Widget page;
  final dynamic bloc;
  PageEntity({required this.route, required this.page, required this.bloc});
}

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.initial,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.signIn,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.signUp,
        page: const SignUp(),
        bloc: BlocProvider(create: (_) => SignUpBloc()),
      ),
      PageEntity(
        route: AppRoutes.mainPages,
        page: const MainPages(),
        bloc: BlocProvider(create: (_) => MainPagesBloc()),
      ),
      PageEntity(
        route: AppRoutes.home,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => PageViewBloc()),
      ),
      PageEntity(
        route: AppRoutes.settings,
        page: const Settings(),
        bloc: BlocProvider(create: (_) => SettingBloc()),
      ),
      PageEntity(
        route: AppRoutes.payment,
        page: const Payment(),
        bloc: BlocProvider(create: (_) => PaymentBloc()),
      ),
      PageEntity(
        route: AppRoutes.achievement,
        page: const Achievement(),
        bloc: BlocProvider(create: (_) => AchievementBloc()),
      ),
      PageEntity(
        route: AppRoutes.love,
        page: const Love(),
        bloc: BlocProvider(create: (_) => LoveBloc()),
      ),
      PageEntity(
        route: AppRoutes.learningReminders,
        page: const LearningReminders(),
        bloc: BlocProvider(create: (_) => LearningRemindersBloc()),
      ),
    ];

  }
  static List<dynamic> allBlocProviders(BuildContext context){
    List<dynamic> providers = <dynamic>[];
    for(var bloc in routes()){
      providers.add(bloc.bloc);
    }
    return providers;
  }

  static MaterialPageRoute generatePage(RouteSettings settings){
    if(settings.name!=null){
      var result = routes().where((element) => element.route==settings.name);
      if(result.isNotEmpty){
          bool checkForOnBoardingOpened = Global.storageServices.getThatOnBoardingOpened();
     // if OnBoarding opened once >>So it will disappear from app and sign_in will replace it.
        if( result.first.route == AppRoutes.initial &&checkForOnBoardingOpened ){
          bool isLoggedIn = Global.storageServices.getLogIn();
          if(isLoggedIn){
            return MaterialPageRoute(builder: (_)=> const MainPages(),settings: settings);
          }
          return MaterialPageRoute(builder: (_)=> const SignIn(),settings: settings);
        }
        return MaterialPageRoute(builder: (_)=> result.first.page,settings: settings);
      }

    }
    print("Not valid ${settings.name}");
    return MaterialPageRoute(builder: (_)=> const SignIn(),settings: settings);
  }

}
