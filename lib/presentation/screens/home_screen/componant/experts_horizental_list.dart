import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oranos/constance/strings_manager.dart';
import 'package:oranos/constance/themes/themes.dart';
import 'package:oranos/data/model/experts_model.dart';

class ExpertsHorizList extends StatefulWidget {
  final String title;
  final listHeight;
  final Widget Function(BuildContext, int) listItem;
  final listLenght;
  const ExpertsHorizList(
      {super.key,
      required this.title,
      required this.listHeight,
      required this.listItem,
      required this.listLenght});

  @override
  State<ExpertsHorizList> createState() => _ExpertsHorizListState();
}

class _ExpertsHorizListState extends State<ExpertsHorizList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontFamily: sFProText,
                fontWeight: FontWeightManager.medium,
                color: Colors.black87),
          ),
          const Spacer(),
          IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {},
              icon: const Icon(Icons.more_horiz, color: Colors.grey))
        ]),
        SizedBox(height: 20.h),
        SizedBox(
          height: widget.listHeight, //242,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: widget.listItem,
            separatorBuilder: (context, index) => SizedBox(width: 9.w),
            itemCount: widget.listLenght,
          ),
        ),
      ],
    );
  }
}
