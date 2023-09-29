
import 'package:flutter/material.dart';
import 'package:u_learning/common/values/color.dart';
import 'package:u_learning/common/values/constant.dart';
import 'package:u_learning/common/services/global.dart';

Widget buildOnBoarding({
  required PageController pageController,
  required double width,
  required double height,
  required BuildContext context,
  required int index,
  required String image,
  required String title,
  required String subTitle1,
  required String subTitle2,
  required String titleOfButton,
}) {
  final double width = MediaQuery.of(context).size.width;
  final double height = MediaQuery.of(context).size.height;
  return Container(
    margin: EdgeInsets.only(top: height * .12),
    child: Column(
      children: [
        SizedBox(
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: height * .10,
          margin: EdgeInsets.only(top: width * .13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: height * .013,
                  ),
                  Text(subTitle1,
                      style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.normal)),
                  Text(
                    subTitle2,
                    style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index <= 2) {
              pageController.animateToPage(index,
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOutSine);
            } else {
              Global.storageServices.setBool(AppConstant.onBoardingOpened, true);
              // bool check = Global.storageServices.getThatOnBoardingOpened();
              Navigator.pushNamedAndRemoveUntil(
                  context, "/signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: height * .042),
            width: width * .75,
            height: height * .075,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.primaryElement,
            ),
            child: Center(
              child: Text(
                titleOfButton,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
