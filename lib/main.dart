import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/routes/routes.dart';
import 'package:u_learning/common/services/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const App());
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child:  const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppPages.generatePage
      ),
    );
  }
}
// routes: {
//   "sign_in":(context)=>const SignIn(),
//   "sign-up":(context)=>const SignUp(),
//   "home":(context)=>const MainPages(),
// },

// theme: ThemeData(
//   appBarTheme: const AppBarTheme(
//     iconTheme: IconThemeData(
//       size: 5,
//       color: AppColors.primaryElement
//     ),
//     elevation: 0,backgroundColor:Colors.black
//   )
// ),