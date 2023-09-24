import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/values/color.dart';
import 'package:u_learning/common/values/constant.dart';
import 'package:u_learning/global.dart';
import 'package:u_learning/main.dart';
import 'package:u_learning/pages/sign-in/sign_in_widgets.dart';

import '../../bloc/main_pages_bloc.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset("assets/icons/arrow.png"),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: reusableText(
            text: "Settings",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width * .8,
              height: width * .35,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Logout"),
                        contentPadding: EdgeInsets.only(top: 22, left: 23),
                        content: const Text(
                          "Confirm Logout?",
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: reusableText(
                                  text: "cancel",
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.primaryElement)),
                          TextButton(
                            onPressed: () {
                              context
                                  .read<MainPagesBloc>()
                                  .add(const MoveToGetPagesByIndexEvent(0));
                              Global.storageServices
                                  .removeKey(AppConstant.onUserLogin);
                              Navigator.of(context).pushNamed("/signIn");
                            },
                            child: reusableText(
                              text: "yes",
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: AppColors.primaryElement,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Image.asset(
                  "assets/icons/Logout.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
