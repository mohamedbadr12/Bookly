import 'package:bookly/Features/home/presentation/views/widgets/Best_Seller_ListView.dart';
import 'package:bookly/Features/home/presentation/views/widgets/Feature_listview.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custon_app_bar.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: CustomAppBar(),
            ),
            FeaturedBooksListView(),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text("Newest Books ", style: Styles.textStyle18),
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
