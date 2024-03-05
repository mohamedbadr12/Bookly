import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/Books_Detail_Section.dart';
import 'package:bookly/Features/home/presentation/views/widgets/Similar_Books_Section.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_books_detail_appbar.dart';
import 'package:flutter/material.dart';

class BookDetailViewBody extends StatelessWidget {
  const BookDetailViewBody({super.key,required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
              child: Column(children: [
                const CustomBookDetailAppBar(),
                BooksDetailSection(bookModel: bookModel),
                const Expanded(
                    child: SizedBox(
                  height: 49,
                )),
                const SimilarBooksSection(),
                   const SizedBox(height: 40,)

              ]),
             ))
      ],
    );
  }
}
