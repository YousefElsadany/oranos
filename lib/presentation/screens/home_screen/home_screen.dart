import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
import 'package:oranos/constance/strings_manager.dart';
import 'package:oranos/constance/themes/themes.dart';
import 'package:oranos/constance/values.dart';
import 'package:oranos/data/model/experts_model.dart';
import 'package:oranos/presentation/screens/home_screen/componant/experts_bottom_sheet.dart';
import 'package:oranos/presentation/screens/home_screen/componant/experts_horizental_list.dart';
import 'package:oranos/presentation/widgets/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SlidingUpPanelController panelController = SlidingUpPanelController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          title:
              Image.asset(ImageAssetsManager.logo, width: 70.w, height: 16.h),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                setState(() {
                  panelController.anchor();
                });
              },
              icon: CircleAvatar(
                  radius: 14.r,
                  backgroundImage: const AssetImage(
                    ImageAssetsManager.man,
                  ))),
          actions: [
            IconButton(
                onPressed: () {}, icon: Image.asset(IconsAssetsManager.search)),
          ],
        ),
        body: Column(
          children: [
            Divider(height: 2.h, color: Colors.grey.shade400),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(14.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ExpertsHorizList(
                            title: 'Recommended Experts',
                            listHeight: 210.h,
                            listItem: (context, index) =>
                                recommendedExpertsItem(
                                    context, recommendedList[index]),
                            listLenght: recommendedList.length),
                        SizedBox(height: 40.h),
                        ExpertsHorizList(
                            title: 'Online Experts',
                            listHeight: 60.h,
                            listItem: (context, index) => onlineExpertsItem(),
                            listLenght: 8),
                      ],
                    ),
                  ),
                  busRouteBottomSheet(context, panelController),
                ],
              ),
            ),
          ],
        ));
  }

  Widget onlineExpertsItem() {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          CircleAvatar(
            radius: 29.r,
            backgroundColor: AppTheme.borderColor,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              radius: 3.5.r,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget recommendedExpertsItem(context, RecommendedModel model) {
    return Container(
      width: 163.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300)),
      child: Column(
        children: [
          Image.asset(model.image),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15.sp,
                    ),
                    Text(
                      '(${model.rate.toString()})',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontFamily: sFProText,
                          fontWeight: FontWeightManager.regular,
                          color: Colors.grey.shade400),
                    ),
                    Spacer(),
                    IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: () {
                          setState(() {
                            model.isFav = !model.isFav;
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: model.isFav == true
                              ? Colors.red
                              : Colors.grey.shade400,
                        )),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  model.name,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: sFProText,
                      fontWeight: FontWeightManager.medium,
                      color: Colors.black87),
                ),
                Text(
                  'Supply Chain',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontFamily: sFProText,
                      fontWeight: FontWeightManager.regular,
                      color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
