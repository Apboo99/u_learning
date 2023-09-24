import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/values/color.dart';
import 'package:u_learning/pages/main_pages/home_page/bloc/page_view_bloc.dart';
import 'package:u_learning/pages/main_pages/home_page/bloc/page_view_event.dart';
import 'package:u_learning/pages/main_pages/home_page/bloc/page_view_state.dart';
import 'package:u_learning/pages/main_pages/home_page/newestCourse/newest.dart';
import 'package:u_learning/pages/sign-in/sign_in_widgets.dart';
import 'package:u_learning/widgets/flutter_toast.dart';
import '../../../sign-up/bloc/sign_up_bloc.dart';

AppBar buildAppBarForHome() {
  return AppBar(
    toolbarHeight: 80,
    elevation: 0,
    backgroundColor: Colors.white,
    title: Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 30,
            margin: const EdgeInsets.only(bottom: 12),
            child: Image.asset("assets/icons/menu.png"),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/luxor.png"),
                fit: BoxFit.fitWidth,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildWelcomeOfHome({required BuildContext context}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  final stateOfUserName = context.read<SignUpBloc>().state;
  print(
      "////////////////////////////////////////////////// ${stateOfUserName.userNameInitial}");
  return Container(
    margin: EdgeInsets.only(
        top: width * .03, left: width * 0.06, right: width * 0.06),
    width: width,
    height: height * .1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: width * 0.01,
        ),
        reusableText(
            text: "Welcome,",
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: AppColors.primarySecondaryElementText),
        reusableText(
            text: "Mohamed",
            // text: stateOfUserName.userNameInitial,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryElement),
        SizedBox(
          height: width * 0.05,
        ),
      ],
    ),
  );
}

Widget searchBar(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [buildSearchOnly(width, height, hintText: 'Search for course'), buildFilterIcon(width)],
  );
}

Widget buildFilterIcon(double width) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(right: width * .06),
      width: width * .13,
      child: Image.asset("assets/icons/filter.png"),
    ),
  );
}

Widget buildSearchOnly(double width, double height,{required String hintText}) {
  return Container(
    margin: EdgeInsets.only(left: width * .06),
    width: width * .73,
    height: height * .062,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(22)),
      border: Border.all(color: Colors.grey, width: 1),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: width * .03),
          width: width * .06,
          height: width * .06,
          child: Image.asset(
            "assets/icons/search.png",
          ),
        ),
        Container(
          width: width * .6,
          height: height * .07,
          child:  TextField(
              decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
            hintText:hintText,
            hintStyle: const TextStyle(color: AppColors.primaryThreeElementText),
          )),
        ),
      ],
    ),
  );
}

Widget pageViewerForHome(PageViewInitial state,
    {required BuildContext context}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  return Container(
    margin:
        EdgeInsets.only(top: width * .1, left: width * .04, right: width * .04),
    width: width,
    height: height * .25,
    child: PageView(
      scrollDirection: Axis.horizontal,
      // controller: pageController,
      physics: const BouncingScrollPhysics(),
      onPageChanged: (value) {
        context.read<PageViewBloc>().add(HomePageDots(index: value));
        state.index = value;
      },
      children: [
        buildContainerOfPageView(
            pathOfImage: "assets/icons/art.png",
            radius: width * .07,
            margin: width * .015),
        buildContainerOfPageView(
            pathOfImage: "assets/icons/Image(2).png",
            radius: width * .07,
            margin: width * .015),
        buildContainerOfPageView(
            pathOfImage: "assets/icons/image(3).png",
            radius: width * .07,
            margin: width * .015),
      ],
    ),
  );
}

Widget buildContainerOfPageView(
    {required String pathOfImage,
    required double radius,
    required double margin}) {
  return Container(
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(pathOfImage), fit: BoxFit.cover),
      color: Colors.blueAccent,
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
    ),
  );
}

Widget buildDotsIndicator({required PageViewInitial state}) {
  return Container(
    margin: const EdgeInsets.only(top: 5),
    child: DotsIndicator(
      position: state.index.toDouble(),
      axis: Axis.horizontal,
      dotsCount: 3,
      decorator: DotsDecorator(
        color: AppColors.primaryFourElementText,
        activeColor: AppColors.primaryElement,
        size: const Size.square(7),
        activeSize: const Size(25, 9),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}

Widget buildMenu(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Container(
    margin: EdgeInsets.only(
        top: width * .03, left: width * .06, right: width * .06),
    width: width * .89,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildChoiceYourCourseText(),
        buildAllPopularNewestText(context,width, height),
        // Container(
        //   width: width * .9,
        //   height: height * .43,
        //   child: GridView(
        //       scrollDirection: Axis.vertical,
        //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2),
        //       physics: const BouncingScrollPhysics(),
        //       children: imageOfGridView),
        // )
      ],
    ),
  );
}

Widget buildAllPopularNewestText(
    BuildContext context, double width, double height) {
  return Container(
    margin: EdgeInsets.only(top: width * .05),
    width: width * .53,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width * .15,
          height: height * .05,
          decoration: const BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: reusableTex2(context, text: "All", onTaps: () {
              return toastInfo(message: "All");
            }),
          ),
        ),
        Center(
          child: reusableTex2(context, text: "Popular", onTaps: () {
            return toastInfo(message: "Popular");
          }),
        ),
        Center(
          child: reusableTex2(
            context,
            text: "Newest",
            onTaps: (){
              //  Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const Newest();
              //     },
              //   ),
              // );
               return const SizedBox();
            },
          ),
        ),
      ],
    ),
  );
}

Widget buildChoiceYourCourseText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        child: reusableText(
            text: "Choice your course",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
      reusableText(
          onTaps: () {
            print("View all");
          },
          text: "View all",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey),
    ],
  );
}

SliverPadding buildSliver(double height) {
  return SliverPadding(
    padding:
        EdgeInsets.symmetric(vertical: height * .01, horizontal: height * .025),
    sliver: SliverGrid(
      delegate: SliverChildBuilderDelegate(childCount: imagesOfSliver.length,
          (context, index) {
        return buildSliverImages(
          height,
          // imagesOfSliver[index].imageForCourse,
          // imagesOfSliver[index].courseTitle,
          onTaps: () {},
          img: imagesOfSliver[index].imageForCourse,
          courseTitle: imagesOfSliver[index].courseTitle,
        );
      }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 10,
          childAspectRatio: 1.1),
    ),
  );
}

Widget buildSliverImages(
  double height, {
  required void Function()? onTaps,
  required String img,
  required String courseTitle,
}) {
  return GestureDetector(
    onTap: onTaps,
    child: Container(
      margin: EdgeInsets.only(top: height * .02),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        // border: Border.all(color: Colors.black,width: 1.5),
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.fill),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: height * .12),
        child: Center(
          child: reusableText(
              text: courseTitle,
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
      ),
    ),
  );
}

List<CollectImageWithData> imagesOfSliver = [
  CollectImageWithData(
      imageForCourse: "assets/icons/Image(1).png",
      courseTitle: "Course For IT"),
  CollectImageWithData(
      imageForCourse: "assets/icons/Image(2).png",
      courseTitle: "Course For CS"),
  CollectImageWithData(
      imageForCourse: "assets/icons/image(3).png",
      courseTitle: "Course For IOT"),
  CollectImageWithData(
      imageForCourse: "assets/icons/image(4).png", courseTitle: "Course For IS")
];

class CollectImageWithData {
  final String imageForCourse;
  final String courseTitle;
  CollectImageWithData(
      {required this.imageForCourse, required this.courseTitle});
}
