import 'package:flutter/material.dart';
import 'package:u_learning/common/values/color.dart';

import '../../../sign-in/sign_in_widgets.dart';
import '../../search_page/widget/search_widgets.dart';

AppBar buildAppBarForChatPage() {
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
              text: "Message",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black),
          SizedBox(width: 27, child: Image.asset('assets/icons/bell.png')),
        ],
      ),
    ),
  );
}

// Widget buildCardForMessagePage(BuildContext context){
//   final width = MediaQuery.of(context).size.width;
//   return  Container(
//     margin: EdgeInsets.symmetric(vertical: width*.1,horizontal: width*.06),
//     height: width*.21,
//     child: Card(
//       elevation: 1.5,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 15, right: 15),
//         child: Row(
//           children: [
//             SizedBox(
//               width: width * .17,
//               height: width * .18,
//               child: Image.asset(
//                 "assets/images/account_header.png",
//                 width: width * .1,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   reusableText(
//                       text:"Mohamed",
//                       fontSize: 19,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                   reusableText(
//                       text: "Hello how are you",
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.grey),
//                 ],
//               ),
//             ),
//              Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       reusableText(text: "6.23 pm", fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey),
//                       buildCircle(context)
//                       // SizedBox(width: 15,)
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }
Widget buildCircle(BuildContext context, {required String number}) {
  final width = MediaQuery.of(context).size.width;
  return Container(
    width: width * .065,
    height: width * .065,
    decoration: BoxDecoration(
        color: AppColors.primaryElement,
        borderRadius: BorderRadius.circular(25)),
    child: Center(
      child: reusableText(
          text: number,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.white),
    ),
  );
}

Widget ShowDataOfTheUsers(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return SliverPadding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    sliver: SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: showDataOfUsers.length,
        (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
                vertical: width * .02, horizontal: width * .055),
            height: width * .21,
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
                        showDataOfUsers[index].image,
                        width: width * .1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            reusableText(
                                text: showDataOfUsers[index].title,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            reusableTextForChat(
                                text: showDataOfUsers[index].subTitle,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              reusableText(
                                  text: showDataOfUsers[index].time,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                              buildCircle(context,
                                  number:
                                      showDataOfUsers[index].numberOfMessage)
                              // SizedBox(width: 15,)
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}

class ShowDataOfUsers {
  final String image;
  final String title;
  final String subTitle;
  final String time;
  final String numberOfMessage;
  ShowDataOfUsers(
      {required this.image,
      required this.title,
      required this.subTitle,
      required this.time,
      required this.numberOfMessage});
}

List<ShowDataOfUsers> showDataOfUsers = [
  ShowDataOfUsers(
      image: "assets/images/account_header.png",
      title: 'Mohamed',
      subTitle: 'السلام عليكم.. كيف حالك',
      time: '9.12 pm',
      numberOfMessage: '2'),
  ShowDataOfUsers(
      image: "assets/icons/01.png",
      title: 'Ahmed',
      subTitle: 'Can you help me plz',
      time: '9.12 pm',
      numberOfMessage: '2'),
  ShowDataOfUsers(
      image: "assets/icons/02.png",
      title: 'Salah',
      subTitle: 'you are a best player',
      time: '9.12 pm',
      numberOfMessage: '3'),
  ShowDataOfUsers(
      image: "assets/icons/01.png",
      title: 'Marwan',
      subTitle: 'Hello My brother..',
      time: '9.12 pm',
      numberOfMessage: '1'),
  ShowDataOfUsers(
      image: "assets/images/account_header.png",
      title: 'Mohamed',
      subTitle: 'السلام عليكم.. كيف حالك',
      time: '9.12 pm',
      numberOfMessage: '2'),
  ShowDataOfUsers(
      image: "assets/icons/01.png",
      title: 'Ahmed',
      subTitle: 'Can you help me plz',
      time: '9.12 pm',
      numberOfMessage: '2'),
  ShowDataOfUsers(
      image: "assets/icons/02.png",
      title: 'Salah',
      subTitle: 'you are a best player',
      time: '9.12 pm',
      numberOfMessage: '3'),
  ShowDataOfUsers(
      image: "assets/icons/01.png",
      title: 'Marwan',
      subTitle: 'Hello My brother..',
      time: '9.12 pm',
      numberOfMessage: '1'),
];

Widget reusableTextForChat(
    {required String text,
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    void Function()? onTaps}) {
  return GestureDetector(
    onTap: onTaps,
    child: Text(
      text,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    ),
  );
}
