import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:u_learning/common/values/color.dart';
import 'package:u_learning/widgets/flutter_toast.dart';

AppBar buildAppBar(String text,double width,double height) {
  return AppBar(
    leading: const SizedBox(),
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Padding(
      padding:  EdgeInsets.only(top: height*.016),
      child: Text(text,
          style: GoogleFonts.alice(
            textStyle: const TextStyle(
                fontFamily: 'GoogleFonts.aBeeZee',
                color: AppColors.primaryElement,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          )),
    ),
  );
}

Widget buildIconsOfSignIn(
    BuildContext context, double width, double height, String pathOfIcon,
    {required void Function() onTaps}) {
  return GestureDetector(
    onTap: onTaps,
    child: Container(
      margin:  EdgeInsets.only(top: height*.010, bottom: height*.018),
      width: width * .26,
      height: height * .063,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(pathOfIcon))),
    ),
  );
}

Widget reusableText({
  required String text,
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
  void Function()? onTaps
}) {
  return GestureDetector(
    onTap: onTaps,
    child: Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    ),
  );
}
Widget reusableTex2(BuildContext context,{required String text,required Widget Function() onTaps})
{

  return InkWell(
    onTap: onTaps,

    child: Text(
      text,
      style:  TextStyle(fontSize: 17, fontWeight: FontWeight.w500,
          color: text=="All"?Colors.white:AppColors.primaryElement),
    ),
  );
}

Widget rabidText({required String text}) {
  return Text(
    text,
    style: const TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black),
  );
}

Padding buildNameOfTextField({required String text}) {
  return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          reusableText(
              text: text,
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.grey),
          const SizedBox(
            height: 5,
          ),
        ],
      ));
}

Widget buildTextField(double width, double height,
    {required String icon,
    required String hintText,
    required TextInputType typeText,
    required String textForCheck,
    required void Function(String value)? func}) {
  return Container(
    width: width * .9,
    height: height * .08,
    margin: const EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border:
            Border.all(color: AppColors.primaryFourElementText, width: 1.2)),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          width: width * .06,
          height: width * .05,
          child: SizedBox(
            width: width * .6,
            height: width * .05,
            child: Image.asset(
              icon,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: width * .70,
          height: width * .05,
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: typeText,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
            ),
            style: const TextStyle(
              fontSize: 15,
            ),
            obscureText: textForCheck == "password" ? true : false,
          ),
        ),
      ],
    ),
  );
}

Widget forgetPassword() {
  return GestureDetector(
      onTap: () {
        toastInfo(message: "Forgrt password? Don't worry");
      },
      child: Column(
        children: [
          rabidText(text: "Forget password?"),
          const SizedBox(
            height: 45,
          ),
        ],
      ));
}

Container buildButtonFree(double width,
    {required String text,
      required Color colorOfText,
      required void Function()? onTaps}) {
  return Container(
    margin: EdgeInsets.only(bottom: 15, top: text == "Guest" ? 10 : 10),
    width: width*.9,
    height: width * .155,
    decoration: BoxDecoration(
      color: text == "Guest"
          ? AppColors.primaryBackground
          : AppColors.primaryBackground,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      border: Border.all(
        color: text == "login"
            ? AppColors.primaryBackground
            : AppColors.primaryElement,
        width: 1,
      ),
    ),
    child: GestureDetector(
      onTap: onTaps,
      child: Center(
        child: reusableText(
            text: text,
            fontSize: 20.5,
            fontWeight: FontWeight.normal,
            color: text == "Guest"
                ? AppColors.primaryText
                : AppColors.primaryText),
      ),
    ),
  );
}



Container buildButton(double width,
    {required String text,
      required Color colorOfText,
    required void Function()? onTaps}) {
  return Container(
    margin: EdgeInsets.only(bottom: 15, top: text == "login" ? 0 : 10),
    width: width,
    height: width * .155,
    decoration: BoxDecoration(
      color: text == "Sign Up"
          ? AppColors.primaryElement
          : AppColors.primaryBackground,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      border: Border.all(
        color: text == "login"
            ? AppColors.primaryElement
            : AppColors.primaryElement,
        width: 1,
      ),
    ),
    child: GestureDetector(
      onTap: onTaps,
      child: Center(
        child: reusableText(
            text: text,
            fontSize: 20.5,
            fontWeight: FontWeight.normal,
            color: text == "login"
                ? AppColors.primaryText
                : AppColors.primaryBackground),
      ),
    ),
  );
}

List<Widget> itemOfIcons(BuildContext context, double width, double height) {
  return [
    buildIconsOfSignIn(context, width, height, "assets/icons/google.png",
        onTaps: () {
      toastInfo(message: "Open google for login ");
    }),
    buildIconsOfSignIn(context, width, height, "assets/icons/apple.png",
        onTaps: () {
      toastInfo(message: "Open apple for login ");
    }),
    buildIconsOfSignIn(context, width, height, "assets/icons/facebook.png",
        onTaps: () {
      toastInfo(message: "Open facebook for login ");
    }),
  ];
}
