import 'package:flutter/material.dart';
import 'package:u_learning/common/values/color.dart';
import 'package:u_learning/pages/sign-in/sign_in_widgets.dart';

AppBar buildAppBarForProfile() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Container(
      margin: const EdgeInsets.only(top: 8, left: 10, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 30,
            child: Image.asset("assets/icons/menu.png"),
          ),
          reusableText(
              text: "Profile",
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.black),
          SizedBox(
            width: 30,
            child: Image.asset("assets/icons/more-vertical.png"),
          ),
        ],
      ),
    ),
  );
}

Widget buildProfilePicture(double width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(top: width * .06),
        width: width,
        height: width * .4,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: width * .25,
                  height: width * .25,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage("assets/icons/luxor.png"),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(55),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SizedBox(
                    width: width * .07,
                    child: Image.asset("assets/icons/edit_3.png"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: width * .02,
            ),
            reusableText(
                text: "Mohamed ",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ],
        ),
      ),
    ],
  );
}

Widget buildCardViewHorizontal(double width) {
  return Container(
    margin: EdgeInsets.only(bottom: width * .1),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildRowContainer(
          width,
          path: 'assets/icons/profile_video.png',
          title: 'My Courses',
          onTaps: () {},
        ),
        buildRowContainer(
          width,
          path: 'assets/icons/profile_book.png',
          title: 'Buy Course',
          onTaps: () {},
        ),
        buildRowContainer(
          width,
          path: 'assets/icons/star(2).png',
          title: '4.1',
          onTaps: () {},
        ),
      ],
    ),
  );
}

Widget buildRowContainer(double width,
    {required String path,
    required String title,
    required void Function()? onTaps}) {
  return GestureDetector(
    onTap: onTaps,
    child: Container(
      width: width * .25,
      height: width * .14,
      decoration: const BoxDecoration(
        color: AppColors.primaryElement,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: width * .08,
            height: width * .07,
            child: Image.asset(path),
          ),
          reusableText(
              text: title,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ],
      ),
    ),
  );
}

Widget buildCardViewVertical(double width, BuildContext context) {
  return Column(
    children: [
      buildVerticalContainer(
        width,
        path: 'assets/icons/settings.png',
        title: 'Settings',
        onTaps: () {
          Navigator.pushNamed(context, "/settings");
        },
      ),
      buildVerticalContainer(
        width,
        path: 'assets/icons/credit-card.png',
        title: 'Payment details',
        onTaps: () {
          Navigator.pushNamed(context, "/Payment");
        },
      ),
      buildVerticalContainer(
        width,
        path: 'assets/icons/award.png',
        title: 'Achievement',
        onTaps: () {
          Navigator.pushNamed(context, "/Achievement");
        },
      ),
      buildVerticalContainer(
        width,
        path: 'assets/icons/heart(1).png',
        title: 'Love',
        onTaps: () {
          Navigator.pushNamed(context, "/Love");
        },
      ),
      buildVerticalContainer(
        width,
        path: 'assets/icons/cube.png',
        title: 'Learning Reminders',
        onTaps: () {
          Navigator.pushNamed(context, "/Learning");
        },
      ),
    ],
  );
}

Widget buildVerticalContainer(
  double width, {
  required String path,
  required String title,
  required void Function()? onTaps,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: onTaps,
        child: Container(
          margin: EdgeInsets.only(left: width * .06),
          width: width * .6,
          height: width * .17,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                width: width * .12,
                height: width * .12,
                decoration: const BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Image.asset(path),
                // child: Image.asset("assets/icons/headpic.png"),
              ),
              SizedBox(
                width: width * .04,
              ),
              reusableText(
                  text: title,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ],
          ),
        ),
      ),
    ],
  );
}
