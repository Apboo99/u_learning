import 'package:flutter/material.dart';
import 'package:u_learning/pages/main_pages/search_page/widget/search_widgets.dart';

import '../../../common/values/color.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBarForSearch(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            searchBarForSearchPage(context),
            buildCategoryCard(context),

          ],
        ),

      )
    );
  }
}
