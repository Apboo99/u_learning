import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/sign-up/bloc/sign_up_event.dart';
import 'package:u_learning/pages/sign-up/sign_up_controller.dart';
import 'package:u_learning/pages/sign-up/sign_up_widgets.dart';

import 'bloc/sign_up_bloc.dart';
import 'bloc/sign_up_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          /////////////////////////////////////////////   AppBar   ////////////////////////////////////////
          appBar: buildAppBar("Sign Up", onTaps: () {
            Navigator.pushNamed(context, "/signIn");
          }),
          body: BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 0,
                        ),
////////////////////////////////////////  Sign up for new account and enjoying with us  //////////////////////////////////////
                        reusableText(
                          text: "Sign up for new account and enjoying with us",
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(.6),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
/////////////////////////////////////////////   TextFields     ///////////////////////////////
                        SizedBox(
                          width: width,
                          height: width * 1.1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
////////////////////////////////////////////    TextField Username     ///////////////////////////////
                              buildNameOfTextField(text: 'Name'),
                              Center(
                                child: buildTextField(
                                  width,
                                  height,
                                  icon: "assets/icons/person.png",
                                  hintText: "Enter your name",
                                  typeText: TextInputType.text,
                                  textForCheck: 'email',
                                  func: (String value) {
                                    context.read<SignUpBloc>().add(UserNameEvent(value));
                                  },
                                ),
                              ),
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
                                    context.read<SignUpBloc>().add(EmailEvent(value));
                                  },
                                ),
                              ),
/////////////////////////////////////////// TextField Password  ///////////////////////////////
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
                                    context.read<SignUpBloc>().add(PasswordEvent(value));
                                  },
                                ),
                              ),
/////////////////////////////////////////// TextField Confirm password  ///////////////////////////////
                              buildNameOfTextField(text: 'Confirm Password'),
                              Center(
                                child: buildTextField(
                                  width,
                                  height,
                                  icon: "assets/icons/lock.png",
                                  hintText: "Enter your password again",
                                  typeText: TextInputType.visiblePassword,
                                  textForCheck: 'password',
                                  func: (String value) {
                                    context.read<SignUpBloc>().add(RePasswordEvent(value));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        rabidText(
                            text:
                                "By creating an account you have to agree with our terms & condition."),
////////////////////////////////////////    Button Of SignUp    //////////////////////////////
                        buildButton(
                          width,
                          text: 'Sign Up',
                          colorOfText: state.colorOfButtonInitial,
                          onTaps: () {
                            // context.read<SignUpBloc>().add(ChangeBackgroundOfButton(Colors.black));
                            SignUpController(context:context).handleSignUp();
                            // Navigator.pushNamed(context, "sign_in");
                          },
                          //
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
