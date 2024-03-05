import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class BookAction extends StatelessWidget {
  const BookAction({super.key,required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(child: CustomButton(background: Colors.white,textColor: Colors.black,text: "Free",

            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16),topLeft: Radius.circular(16)), onPressed: () {  },)),
          Expanded(child:
          CustomButton(background: const Color(0xffEF8262),textColor: Colors.white,text: getText(bookModel),fontSize: 16,
    onPressed:()async {
            Uri uri=Uri.parse(bookModel.volumeInfo.previewLink!);

    if (await canLaunchUrl(uri)){
      await launchUrl(uri);
    }
    },
            borderRadius: const BorderRadius.only(bottomRight: Radius.circular(16),topRight: Radius.circular(16)),)),
        ],
      ),
    );
  }
 String getText(BookModel bookModel){
    if(bookModel.volumeInfo.previewLink ==null){
      return "not Available";
    }
    else{
      return "Preview";
    }
  }
}