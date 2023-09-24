import 'package:flutter/material.dart';
import 'package:u_learning/pages/main_pages/courses_page/widget/courses_widget.dart';

import '../../../common/values/color.dart';
import '../search_page/widget/search_widgets.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBarForCoursePage(),
      body:  CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
            SliverToBoxAdapter(child: buildContainerOfCourseView(
                context,pathOfImage: "assets/icons/art.png", radius: 30, margin: 10),),
              SliverToBoxAdapter(child: searchBarForCoursePage(context)),
              SliverToBoxAdapter(child:AllCourseTextInRowWithAllView()),
              buildSliverForCourse(context),



        ]
      ),
    );
  }
}
