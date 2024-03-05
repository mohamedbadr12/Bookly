import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/Books_rating.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_list_View_item.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key,required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){


      GoRouter.of(context).push("/bookDetail",extra: bookModel);},
      child: SizedBox(height: 120,
        child: Row(
          children: [
            FeaturedListViewItem(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ""),

            const SizedBox(width: 30,),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*.5,
                      child:  Text(bookModel.volumeInfo.title!,maxLines: 2,style: Styles.textStyle20.copyWith(
                        overflow:TextOverflow.ellipsis ,
                          fontFamily: kGtSectraFine
                      ),)),
                  const SizedBox(height: 3,),
                  Opacity(opacity: .7,
                      child: Text(bookModel.volumeInfo.authors![0] ,style: Styles.textStyle14.copyWith(),)),
                  const SizedBox(height: 3,),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("Free",style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold
                    ),),
                     BookRating(count:bookModel.volumeInfo.ratingsCount?? 0
                       ,rating: bookModel.volumeInfo.averageRating??0,)
                  ],)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
