import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_newspaper_app/router.dart';
import 'package:flutter_ds_bfi/flutter_ds_bfi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Boiler Plate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: DSColor.primaryBlue,
          highlightColor: Colors.transparent,
          brightness: Brightness.light,
          splashColor: Colors.transparent,
          appBarTheme:
              const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark)),
      darkTheme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: DSColor.primaryBlue,
          highlightColor: Colors.transparent,
          brightness: Brightness.dark,
          splashColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.light)),
      onGenerateRoute: Routers.generateRoute,
      initialRoute: '/home-route',
    );
  }
}
