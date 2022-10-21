import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ds_bfi/flutter_ds_bfi.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/route_util.dart';
import 'core/utils/strings_util.dart';
import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          title: Strings.appTitle,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: Strings.fontFamily,
            primaryColor: DSColor.primaryBlue,
            highlightColor: Colors.transparent,
            brightness: Brightness.light,
            splashColor: Colors.transparent,
            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.dark),
          ),
          darkTheme: ThemeData(
            fontFamily: Strings.fontFamily,
            primaryColor: DSColor.primaryBlue,
            highlightColor: Colors.transparent,
            brightness: Brightness.dark,
            splashColor: Colors.transparent,
            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.light),
          ),
          onGenerateRoute: Routers.generateRoute,
          initialRoute: RouteUtil.splashRoute,
        );
      },
    );
  }
}
