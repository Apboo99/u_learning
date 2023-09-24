import 'package:flutter/material.dart';

import '../../../sign-in/sign_in_widgets.dart';
import '../../home_page/widget/homeWidget.dart';
import '../../search_page/widget/search_widgets.dart';

AppBar buildAppBarForCoursePage() {
  return AppBar(
    toolbarHeight: 60,
    backgroundColor: Colors.white,
    elevation: 0,
    title: Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 30,
            child: Image.asset("assets/icons/menu.png"),
          ),
          reusableText(
              text: "Your courses",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black),
          const SizedBox(
            width: 30,
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildContainerOfCourseView(BuildContext context,
    {required String pathOfImage,
    required double radius,
    required double margin}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Container(
    margin: EdgeInsets.only(top: width * .05),
    color: Colors.white,
    child: Container(
      height: height * .218,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(pathOfImage)),
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
    ),
  );
}

Widget searchBarForCoursePage(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Container(
    margin: EdgeInsets.only(top: width * .03, bottom: width * .06),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildSearchOnly(width, height, hintText: 'Search your course'),
        buildFilterIcon(width),
      ],
    ),
  );
}

Widget AllCourseTextInRowWithAllView() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        reusableText(
            text: "All Course",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black),
        reusableText(
            text: "View All",
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.grey)
      ],
    ),
  );
}


Widget buildSliverForCourse(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return SliverPadding(
    padding:
        EdgeInsets.symmetric(vertical: height * .02, horizontal: width * .01),
    sliver: SliverGrid(
      delegate: SliverChildBuilderDelegate(childCount: showData.length,
          (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Card(
            elevation: 1.5,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  SizedBox(
                    width: width * .17,
                    height: width * .18,
                    child: Image.asset(
                      showData[index].image,
                      width: width * .1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        reusableText(
                            text: showData[index].title,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        reusableText(
                            text: showData[index].subTitle,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 23,
                        ),
                        // SizedBox(width: 15,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 0,
          crossAxisSpacing: 10,
          childAspectRatio: 3),
    ),
  );
}



// Widget buildCategoryCardOfCourse(BuildContext context) {
//   final width = MediaQuery.of(context).size.width;
//   final height = MediaQuery.of(context).size.height;
//   return SizedBox(
//     height: height*.43,
//     child: ListView.builder(
//         itemCount: showData.length,
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context,index){
//           return Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20),
//             width: width,
//             height: height * .13,
//             child: Card(
//               color: Colors.white,
//               elevation: 1.5,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 15,right: 15),
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: width * .17,
//                       height: width * .18,
//                       child: Image.asset(
//                         showData[index].image,
//                         width: width * .1,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 15),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           reusableText(
//                               text: showData[index].title,
//                               fontSize: 19,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black),
//                           reusableText(
//                               text: showData[index].subTitle,
//                               fontSize: 16,
//                               fontWeight: FontWeight.normal,
//                               color: Colors.grey),
//                         ],
//                       ),
//                     ),
//                     const Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Icon(
//                             Icons.arrow_forward_ios,
//                             size: 23,
//                           ),
//                           // SizedBox(width: 15,)
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }),
//   );
// }