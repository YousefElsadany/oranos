import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
import 'package:oranos/constance/strings_manager.dart';
import 'package:oranos/constance/themes/themes.dart';
import 'package:oranos/constance/values.dart';

SlidingUpPanelWidget busRouteBottomSheet(context, panelController) {
  return SlidingUpPanelWidget(
    // ignore: sort_child_properties_last
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 30.w,
            height: 4.h,
            alignment: AlignmentDirectional.topCenter,
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(8.r)),
          ),
          SizedBox(height: 13.h),
          bottomSheetItem(context,
              image: ImageAssetsManager.info,
              title: StringsManager.infoTech,
              subTitle: '23 Experts',
              pressed: () {}),
          SizedBox(height: 15.h),
          bottomSheetItem(context,
              image: ImageAssetsManager.supply,
              title: StringsManager.supply,
              subTitle: '12 Experts',
              pressed: () {}),
          SizedBox(height: 15.h),
          bottomSheetItem(context,
              image: ImageAssetsManager.security,
              title: StringsManager.security,
              subTitle: '14 Experts',
              pressed: () {}),
          SizedBox(height: 15.h),
          bottomSheetItem(context,
              image: ImageAssetsManager.human,
              title: StringsManager.human,
              subTitle: '12 Experts',
              pressed: () {}),
          SizedBox(height: 15.h),
          bottomSheetItem(context,
              image: ImageAssetsManager.immigration,
              title: StringsManager.immigration,
              subTitle: '18 Experts',
              pressed: () {}),
          SizedBox(height: 15.h),
          bottomSheetItem(context,
              image: ImageAssetsManager.translation,
              title: StringsManager.translation,
              subTitle: '3 Experts',
              pressed: () {}),
        ],
      ),
    ),
    controlHeight: 35.h, //displayHeight(context) / 6,
    anchor: 0.8,
    panelController: panelController,
    panelStatus: SlidingUpPanelStatus.dragging,
    onTap: () {
      if (SlidingUpPanelStatus.expanded == panelController.status) {
        panelController.collapse();
      } else {
        panelController.expand();
      }
    },
    dragDown: (details) {
      print('dragDown');
    },
    dragStart: (details) {
      print('dragStart');
    },
    dragCancel: () {
      print('dragCancel');
    },
    dragUpdate: (details) {
      print(
          'dragUpdate,${panelController.status == SlidingUpPanelStatus.dragging ? 'dragging' : ''}');
    },
    dragEnd: (details) {
      print('dragEnd');
    },
  );
}

Widget bottomSheetItem(context,
        {required image,
        required String title,
        required String subTitle,
        required pressed}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(14.w),
          width: double.infinity,
          height: 60.h,
          alignment: AlignmentDirectional.topCenter,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                image,
              ),
              SizedBox(width: 15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontFamily: sFProText,
                          fontWeight: FontWeightManager.medium,
                          color: Colors.black87)),
                  SizedBox(height: 5.w),
                  Text(subTitle,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontFamily: sFProText,
                          fontWeight: FontWeightManager.regular,
                          color: AppTheme.greyColor)),
                ],
              ),
              Spacer(),
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: pressed,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: AppTheme.greyColor,
                    size: 16.sp,
                  )),
            ],
          ),
        ),
      ],
    );
