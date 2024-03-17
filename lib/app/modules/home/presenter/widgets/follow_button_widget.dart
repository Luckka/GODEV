import 'package:flutter/material.dart';

class FollowButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final Color textColor;
  const FollowButtonWidget({super.key, required this.onPressed, required this.backgroundColor, required this.borderColor, required this.text, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2),
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(5)

          ),
          alignment: Alignment.center,
          child: Text(text,style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold
          ),),
          width: 250,
          height: 27,
        ),

      ),
    );
  }
}
