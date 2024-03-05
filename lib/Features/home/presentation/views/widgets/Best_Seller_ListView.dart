import 'package:bookly/Features/home/presentation/manger/newest_book_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/best_seller_listview_item.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit,NewestBooksState>(builder: (context, state) {
      if(state is NewestBooksSuccess) {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return  Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BestSellerListViewItem(bookModel: state.books[index],));
            });
      }
      else if(state is NewestBooksFailure){
        return  CustomErrorWidget(errorMessage: state.errMessage);
      }
      else{
        return const CustomLoadingIn();
      }
    },

    );
  }}
