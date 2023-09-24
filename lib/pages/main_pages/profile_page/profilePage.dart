import 'package:flutter/material.dart';
import 'package:u_learning/pages/main_pages/profile_page/widget/profileWidget.dart';

import '../../../common/values/color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBarForProfile(),
      body: Column(
        children: [
          buildProfilePicture(width),
          buildCardViewHorizontal(width),
          buildCardViewVertical(width,context)
        ],
      )
    );
  }
}
