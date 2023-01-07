import 'dart:convert';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oranos/app_router.dart';
import 'package:oranos/buisness_logic/chat_cubit/chat_cubit.dart';
import 'package:oranos/constance/themes/themes.dart';
import 'package:oranos/constance/values.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => MyApp(
      appRouter: AppRouter(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              title: 'Oranos',
              theme: AppTheme().theme(),
              onGenerateRoute: widget.appRouter.generateRoute,
              initialRoute: startScreen, //mainScreen,
              debugShowCheckedModeBanner: false,
            );
          }),
    );
  }
}
