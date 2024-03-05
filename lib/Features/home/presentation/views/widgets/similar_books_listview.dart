import 'package:bookly/Features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_list_View_item.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(builder: (context, state) {
      if(state is SimilarBooksSuccess){
        return  SizedBox(height: MediaQuery.of(context).size.height *.15,
          child: ListView.builder(itemCount: state.books.length,
            scrollDirection: Axis.horizontal,

            itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FeaturedListViewItem(imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ??""),
              );
            },),
        );
      }
      else if(state is SimilarBooksFailure){
        return CustomErrorWidget(errorMessage:state.errMessage);
      }
      else {
        return const CustomLoadingIn();
      }

    },

    );
  }
}

