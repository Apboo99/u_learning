import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/values/constant.dart';
import 'package:u_learning/global.dart';
import 'package:u_learning/pages/sign-in/bloc/sign_in_bloc.dart';
import 'package:u_learning/pages/sign-in/bloc/sign_in_state.dart';
import 'package:u_learning/pages/sign-in/sign_in_controller.dart';
import 'package:u_learning/pages/sign-in/sign_in_widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            /////////////////////////////////////////////   AppBar   ////////////////////////////////////////
            appBar: buildAppBar("Login", width, height),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    top: height * .05, left: height * .03, right: height * .03),
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: height * .0,
                    // ),
///////////////////////////////////////////////////   Icons For Login  ///////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: itemOfIcons(context, width, height),
                    ),
//////////////////////////////////////////////////////////////////////////////////////////////////////
                    SizedBox(
                      height: height * .015,
                    ),
////////////////////////////////////////    "Or use your email account login"    //////////////////////////////////////
                    reusableText(
                      text: "Or use your email account login",
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black.withOpacity(.6),
                    ),
                    SizedBox(
                      height: height * .025,
                    ),
/////////////////////////////////////////////     TextFields     ///////////////////////////////
                    Container(
                      padding: EdgeInsets.only(top: height * .01),
                      width: width,
                      height: width * .65,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
////////////////////////////////////////////    TextField Email     ///////////////////////////////
                          buildNameOfTextField(text: 'Email'),
                          Center(
                            child: buildTextField(
                              width,
                              height,
                              icon: "assets/icons/person.png",
                              hintText: "Enter your email",
                              typeText: TextInputType.emailAddress,
                              textForCheck: 'email',
                              func: (String value) {
                                context.read<SignInBloc>().add(
                                      EmailEvent(value),
                                    );
                              },
                            ),
                          ),
///////////////////////////////////////////     TextField Password    ///////////////////////////////
                          buildNameOfTextField(text: 'Password'),
                          Center(
                            child: buildTextField(
                              width,
                              height,
                              icon: "assets/icons/lock.png",
                              hintText: "Enter your password",
                              typeText: TextInputType.text,
                              textForCheck: 'password',
                              func: (String value) {
                                context.read<SignInBloc>().add(
                                      PasswordEvent(value),
                                    );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
///////////////////////////////////////////      ForgetPassword     ///////////////////////////////
                    forgetPassword(),
///////////////////////////////////////////    Button Of Login    //////////////////////////////
                    buildButton(
                      width,
                      text: 'login',
                      colorOfText: Colors.white,
                      onTaps: () {
                        Global.storageServices
                            .setBool(AppConstant.onUserLogin, true);
                        SignInController(context: context)
                            .handleSignIn("email");
                      },
                    ),
////////////////////////////////////////    Button Of SignUp    //////////////////////////////
                    buildButton(
                      width,
                      text: 'Sign Up',
                      colorOfText: Colors.black,
                      onTaps: () {
                        Navigator.pushNamed(context, "/signUp");
                      },
                    ),
                    buildButtonFree(
                      width,
                      text: 'Guest',
                      colorOfText: Colors.black,
                      onTaps: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/mainPages",
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
