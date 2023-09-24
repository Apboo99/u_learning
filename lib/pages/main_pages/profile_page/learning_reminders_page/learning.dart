import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../sign-in/sign_in_widgets.dart';

class LearningReminders extends StatelessWidget {
  const LearningReminders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Center(child: rabidText(text: "LearningReminders"),),
        )
    );
  }
}
