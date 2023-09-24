

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/main_pages/widgetsOfMainPages/main_pages_widgets.dart';

import 'bloc/main_pages_bloc.dart';
import 'bloc/main_pages_state.dart';

class MainPages extends StatelessWidget {
  const MainPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: BlocBuilder<MainPagesBloc, MainPagesState>(
        builder: (context, state) {
          return Scaffold(

            backgroundColor: Colors.white,
            body: Center(
              child: pageViewer(state.index),
            ),
            bottomNavigationBar: buildBaseNavigationBar(width, state, context),
          );
        },
      ),
    );
  }

}
