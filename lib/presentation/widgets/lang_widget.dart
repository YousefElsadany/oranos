import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oranos/constance/themes/themes.dart';

Widget langWidget(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.language,
        size: 16.sp,
      ),
      SizedBox(
        width: 5.w,
      ),
      Text(
        'English',
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontWeight: FontWeightManager.medium),
      ),
    ],
  );
}
