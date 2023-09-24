import 'package:flutter/material.dart';
import 'package:u_learning/pages/main_pages/chat_page/widget/chat_widget.dart';
import '../../../common/values/color.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBarForChatPage(),
      body:  CustomScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        slivers: [
          // buildCardForMessagePage(context),
          ShowDataOfTheUsers(context)
        ],
      )
    );
  }
}
