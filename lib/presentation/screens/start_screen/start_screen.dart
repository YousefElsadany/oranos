import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oranos/constance/strings_manager.dart';
import 'package:oranos/constance/themes/themes.dart';
import 'package:oranos/constance/values.dart';
import 'package:oranos/presentation/widgets/custom_appbar.dart';
import 'package:oranos/presentation/widgets/lang_widget.dart';
import 'package:oranos/presentation/widgets/main_button.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: customAppbar(),
        body: Stack(children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageAssetsManager.startBackground),
                  fit: BoxFit.fill),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(14.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: displayHeight(context) / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(ImageAssetsManager.logo),
                      SizedBox(height: 20.h),
                      Text(
                        StringsManager.startText,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                color: AppTheme.greyColor,
                                fontWeight: FontWeightManager.semiBold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      mainButton(context,
                          buttonColor: AppTheme.mainColor,
                          textButtomColor: Colors.white,
                          text: StringsManager.startButton,
                          buttonWidth: displayWidth(context), press: () {
                        Navigator.of(context)
                            .pushReplacementNamed(getStartScreen);
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringsManager.askAboutAccount,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontWeight: FontWeightManager.medium),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              StringsManager.signUp,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: AppTheme.mainColor,
                                      fontWeight: FontWeightManager.medium),
                            ),
                          ),
                        ],
                      ),
                      langWidget(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
