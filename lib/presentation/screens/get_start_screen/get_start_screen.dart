import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oranos/constance/strings_manager.dart';
import 'package:oranos/constance/themes/themes.dart';
import 'package:oranos/constance/values.dart';
import 'package:oranos/presentation/widgets/custom_appbar.dart';
import 'package:oranos/presentation/widgets/lang_widget.dart';
import 'package:oranos/presentation/widgets/main_button.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({super.key});

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppbar(),
      body: Padding(
        padding: EdgeInsets.all(14.h),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: displayWidth(context) * 0.085),
                        child: Image.asset(ImageAssetsManager.shape),
                      ),
                      Container(
                        width: 200.w,
                        padding: EdgeInsets.only(top: 20),
                        child: RichText(
                          text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontWeight: FontWeightManager.medium,
                                ),
                            children: <TextSpan>[
                              TextSpan(text: StringsManager.botMessage1),
                              TextSpan(
                                text: StringsManager.botMessage2,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      fontWeight: FontWeightManager.bold,
                                    ),
                              ),
                              TextSpan(
                                text: StringsManager.botMessage3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(ImageAssetsManager.bot),
                  SizedBox(
                    height: 20.h,
                  ),
                  mainButton(
                    context,
                    buttonColor: AppTheme.mainColor,
                    textButtomColor: Colors.white,
                    text: 'Next',
                    buttonWidth: displayWidth(context) * 0.343,
                    press: () {
                      Navigator.of(context).pushReplacementNamed(chatScreen);
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: langWidget(context),
            ),
          ],
        ),
      ),
    );
  }
}
