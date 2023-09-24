import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:u_learning/common/values/color.dart';

AppBar buildAppBar(String text, {required void Function()? onTaps}) {
  return AppBar(
    leading: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: GestureDetector(
            onTap: onTaps, child: const Icon(Icons.arrow_back_ios))),
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text(text,
          style: GoogleFonts.alice(
            textStyle: const TextStyle(
                fontFamily: 'GoogleFonts.aBeeZee',
                color: AppColors.primaryElement,
                fontSize: 27,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          )),
    ),
  );
}

Widget buildIconsOfSignIn(
    BuildContext context, double width, double height, String pathOfIcon) {
  return Container(
    margin: const EdgeInsets.only(top: 5, bottom: 20),
    width: width * .25,
    height: height * .065,
    decoration:
        BoxDecoration(image: DecorationImage(image: AssetImage(pathOfIcon))),
  );
}

Widget reusableText({
  required String text,
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
}) {
  return Text(
    text,
    style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
  );
}

Widget rabidText({required String text}) {
  return Text(
    text,
    style: const TextStyle(
        fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey),
  );
}

Padding buildNameOfTextField({required String text}) {
  return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          reusableText(
              text: text,
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.grey),
          const SizedBox(
            height: 10,
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
    height: height * .07,
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

Widget buildButton(double width,
    {required String text,
    required Color colorOfText,
    required void Function()? onTaps}) {
  return Container(
    margin: const EdgeInsets.only(top: 50),
    width: width,
    height: width * .14,
    decoration: BoxDecoration(
      color: text == "Sign Up"
          ? AppColors.primaryElement
          : AppColors.primaryBackground,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      border: Border.all(
        color: text == "Sign Up"
            ? AppColors.primaryElement
            : AppColors.primaryFourElementText,
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
          color: text == "Sign Up"
              ? AppColors.primarySecondaryBackground
              : AppColors.primaryText,
        ),
      ),
    ),
  );
}
