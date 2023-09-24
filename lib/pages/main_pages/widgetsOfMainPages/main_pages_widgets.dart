import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/values/color.dart';
import 'package:u_learning/pages/main_pages/chat_page/chatPage.dart';
import 'package:u_learning/pages/main_pages/profile_page/profilePage.dart';
import 'package:u_learning/pages/main_pages/search_page/search.dart';
import '../bloc/main_pages_bloc.dart';
import '../bloc/main_pages_state.dart';
import '../courses_page/course.dart';
import '../home_page/home.dart';

Widget pageViewer(int index){
  List<Widget> viewer =const [
    HomePage(),
    SearchPage(),
    CoursesPage(),
    ChatPage(),
    ProfilePage(),

  ];
  return viewer[index];
}

BottomNavigationBarItem buildBottomNavigationBarItem(
    {required String label, required String path}) {
  return BottomNavigationBarItem(
    label: label,
    activeIcon: SizedBox(
        width: 30,
        height: 26,
        child: Image.asset("assets/icons/$path.png",color: AppColors.primaryElement,)),
    icon: Container(
        width: 25,
        height: 20,
        child: Image.asset("assets/icons/$path.png")),
  );
}

var itemsOfBottomNavigationBar = [
  buildBottomNavigationBarItem(label: 'home', path: 'home'),
  buildBottomNavigationBarItem(label: 'search', path: 'search2'),
  buildBottomNavigationBarItem(
      label: 'course', path: 'play-circle1'),
  buildBottomNavigationBarItem(label: 'chat', path: 'message'),
  buildBottomNavigationBarItem(label: 'profile', path: 'person'),
];

Container buildBaseNavigationBar(double width, MainPagesState state, BuildContext context) {
  return Container(
    width: width,
    height: width * .15,
    decoration: BoxDecoration(
      color: AppColors.primaryElement,
      boxShadow: [
        BoxShadow(
            color: Colors.deepPurple.withOpacity(.3),
            blurRadius: 2,
            spreadRadius: 2)
      ],
    ),
    child: BottomNavigationBar(
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      currentIndex: state.index,
      onTap: (int value) {
        context.read<MainPagesBloc>().add(MoveToGetPagesByIndexEvent(value));
      },
      items: itemsOfBottomNavigationBar,
    ),
  );
}
