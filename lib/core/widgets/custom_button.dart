import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const  CustomButton({super.key, required this.background, required this.textColor,  this.borderRadius, required this.text,  this.fontSize,required this.onPressed});
final Color background;
final Color textColor;
final String text;
final double ?fontSize;
final BorderRadius? borderRadius;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 48,

      child: TextButton(

          style: TextButton.styleFrom(
              backgroundColor:background ,
        shape: ( RoundedRectangleBorder(borderRadius:borderRadius??BorderRadius.circular(12)
       ))
      ),

          onPressed: onPressed,
          child: Text(text,style: Styles.textStyle18.copyWith(
            fontSize: fontSize,
                 color: textColor,
                fontWeight: FontWeight.w900
          ),)),
    );
  }
}
