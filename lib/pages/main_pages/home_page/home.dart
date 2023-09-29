
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/main_pages/home_page/widget/homeWidget.dart';
import 'bloc/page_view_bloc.dart';
import 'bloc/page_view_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBarForHome(),
        body: BlocBuilder<PageViewBloc, PageViewInitial>(
          builder: (context, state) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: buildWelcomeOfHome(context: context),),
            SliverToBoxAdapter(child: searchBar(context),),
            SliverToBoxAdapter(child: pageViewerForHome(context: context, state)),
            SliverToBoxAdapter(child: buildDotsIndicator(state: state)),
            SliverToBoxAdapter(child: buildMenu(context),),
             buildSliver(height)
          ],
        );
          },
        ),
        // body: Container(
        //   child:
        // ),
      ),
    );
  }


}
