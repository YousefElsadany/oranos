import 'package:flutter/material.dart';
import 'package:oranos/constance/themes/themes.dart';

Widget mainButton(
  BuildContext context, {
  required Color buttonColor,
  Color? textButtomColor,
  double? buttonWidth,
  double? buttonHeight,
  double? borderRadius = 8,
  Color boarderColor = Colors.transparent,
  required String text,
  required Function()? press,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
        border: Border.all(color: boarderColor),
        color: buttonColor,
      ),
      width: buttonWidth,
      height: buttonHeight,
      child: MaterialButton(
        onPressed: press,
        child: Text(text,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: textButtomColor,
                  fontWeight: FontWeightManager.medium,
                )),
      ),
    );

Widget secondMainButton(
  context, {
  required String text,
  buttonColor,
  required borderRadius,
  Color boarderColor = Colors.transparent,
  required press,
  buttonHeight,
  buttonWidth,
}) =>
    mainButton(
      context,
      buttonColor: Colors.transparent,
      textButtomColor: boarderColor,
      borderRadius: borderRadius,
      boarderColor: boarderColor,
      buttonHeight: buttonHeight,
      buttonWidth: buttonWidth,
      text: text,
      press: press,
    );
