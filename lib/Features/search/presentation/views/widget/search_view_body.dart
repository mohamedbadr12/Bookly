
import 'package:bookly/Features/search/presentation/views/widget/custom_search_textfield.dart';
import 'package:bookly/Features/search/presentation/views/widget/search_result_listview.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
children: [

  CustomSearchTextField(),
  SizedBox(height: 16,),
  Text("Search Result", style: Styles.textStyle18),
  SizedBox(height: 16,),

  Expanded(child: SearchResultListView())
],
      ),
    );
  }
}


