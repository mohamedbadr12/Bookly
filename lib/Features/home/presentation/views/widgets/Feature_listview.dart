import 'package:bookly/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_list_View_item.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(builder: (context, state) {
      if(state is FeaturedBooksSuccess) {
        return SizedBox(height: MediaQuery
            .of(context)
            .size
            .height * .3,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,

            itemBuilder: (context, index) {
              return  Padding(

                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(onTap: (){
                  GoRouter.of(context).push("/bookDetail",extra: state.books[index]);
                },
                    child: FeaturedListViewItem(imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? "")),
              );
            },),
        );
      }
      else if(state is FeaturedBooksFailure){
        return CustomErrorWidget(errorMessage: state.errMessage);

      }
      else{
        return const CustomLoadingIn();
      }
    },

    );
  }
}