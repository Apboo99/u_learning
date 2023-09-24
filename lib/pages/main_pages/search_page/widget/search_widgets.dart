import 'package:flutter/material.dart';

import '../../../sign-in/sign_in_widgets.dart';
import '../../home_page/widget/homeWidget.dart';

AppBar buildAppBarForSearch() {
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
              text: "Search",
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

Widget searchBarForSearchPage(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Container(
    margin: EdgeInsets.only(top: width * .1, bottom: width * .12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildSearchOnly(width, height, hintText: 'Search...'),
        buildFilterIcon(width),
      ],
    ),
  );
}

Widget buildCategoryCard(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return SizedBox(
    height: height*.69,
    child: ListView.builder(
      itemCount: showData.length,
      scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context,index){
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: width,
            height: height * .13,
            child: Card(
              color: Colors.white,
              elevation: 1.5,
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
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
  );
}

class ShowDataOfCard {
  final String image;
  final String title;
  final String subTitle;
  ShowDataOfCard(
      {required this.image, required this.title, required this.subTitle});
}

List<ShowDataOfCard> showData = [
  ShowDataOfCard(
      image: "assets/icons/image(7).png",
      title: 'Marketing',
      subTitle: '40 Lesson'),
  ShowDataOfCard(
      image: 'assets/icons/image(8).png',
      title: 'User Interface',
      subTitle: '30 Lesson'),
  ShowDataOfCard(
      image: "assets/icons/image(9).png",
      title: 'Design',
      subTitle: '33 Lesson'),
  ShowDataOfCard(
      image: 'assets/icons/image(6).png',
      title: 'Photoshop',
      subTitle: '18 Lesson'),
  ShowDataOfCard(
      image: "assets/icons/image(7).png",
      title: 'Marketing',
      subTitle: '40 Lesson'),
  ShowDataOfCard(
      image: 'assets/icons/image(8).png',
      title: 'User Interface',
      subTitle: '30 Lesson'),
  ShowDataOfCard(
      image: "assets/icons/image(9).png",
      title: 'Design',
      subTitle: '33 Lesson'),
  ShowDataOfCard(
      image: 'assets/icons/image(6).png',
      title: 'Photoshop',
      subTitle: '18 Lesson'),
];
