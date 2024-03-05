import 'package:bookly/Features/home/presentation/views/widgets/similar_books_listview.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';
class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(alignment: Alignment.centerLeft ,
            child:  Text("You can also like",style: Styles.textStyle14.copyWith(
            ),)),
        const SizedBox(height: 16,),
        const SimilarBookListView(),
      ],


    );
  }
}
