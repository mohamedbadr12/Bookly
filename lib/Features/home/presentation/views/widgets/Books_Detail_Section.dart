import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_list_View_item.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

import 'Books_rating.dart';
class BooksDetailSection extends StatelessWidget {
  const BooksDetailSection({super.key,required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *.2),
            child:  FeaturedListViewItem(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??"")),
        const SizedBox(height: 43,),
        Text(bookModel.volumeInfo.title!,textAlign: TextAlign.center,style: Styles.textStyle30.copyWith(


            fontFamily: kGtSectraFine
        ),),
        const SizedBox(height: 6,),
        Opacity(opacity: .7,
          child: Text(bookModel.volumeInfo.authors?[0]??"",style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500
          ),),
        ),
        const SizedBox(height: 18,),
         BookRating(
           mainAxisAlignment: MainAxisAlignment.center,
          rating:bookModel.volumeInfo.averageRating ??0,
          count: bookModel.volumeInfo.ratingsCount ??0,

        ),
        const SizedBox(height: 37,),
         BookAction(bookModel: bookModel),

      ],
    );
  }
}