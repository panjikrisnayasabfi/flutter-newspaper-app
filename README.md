# Flutter BFI Boilerplate V2

Flutter BFI Boilerplate V2 (with null safety)

## Getting Started

This Boilerplate V2 is using Flutter version 3.0.0 (with null safety) and minimal Dart SDK 2.12.0. The Boilerplate contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, utilities, constants, bfi design system, and required dependencies to create a new project. By using boiler plate code as standard initializer, we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/bfi-finance/flutter-boiler-plate-v2.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
```

If you use FVM run the following command:

```
fvm flutter pub get
```

**Step 3:**

Change the app package name using `change_app_package_name` library, by run this following command:

```
flutter pub run change_app_package_name:main your.package.name
```

If you use FVM run the following command:

```
fvm flutter pub run change_app_package_name:main your.package.name
```

## Boilerplate Features:

- Home

### Libraries & Tools Used

- [Dio](https://github.com/flutterchina/dio)
- [Flutter Bloc](https://github.com/felangel/bloc/tree/master/packages/flutter_bloc)
- [Equatable](https://github.com/felangel/equatable)
- [Json Annotation](https://github.com/google/json_serializable.dart/tree/master/json_annotation)
- [Json Serializable](https://github.com/google/json_serializable.dart/tree/master/json_serializable)
- [RxDart](https://github.com/ReactiveX/rxdart)
- [Intl](https://github.com/dart-lang/intl)
- [Flutter DS BFI](https://github.com/satriantorobimo/flutter_bfi_ds)
- [Change App Package Name](https://github.com/atiqsamtia/change_app_package_name)

### Folder Structure

Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- assets
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- feature/
|- core/
|- main.dart
|- router.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- feature - Features in this app.
2- core - Core is for utilities, and values for url.
3- router.dart — This file contains all the routes for your application.
4- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### Routes

This file contains all the routes for your application.

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

### Core

This directory contains all the application level core. A separate folder is created for each type as shown in example below:

```
core/
|- resources/
|- utils/
```

### Home

This directory contains all the feature of your application. There is some folder in feature like data, domain, and presentation. A separate folder is created for each type as shown in example below:

```
home/
|- data/
|- domain/
|- presentation/
```

### Presentation

This directory contains all the ui and state management i.e `bloc` of your application. Each screen is located in a separate folder making it easy to combine group of files related to that particular screen. All the screen specific widgets will be placed in `widgets` directory as shown in the example below:

```
presentation/
|- screen/
|- widget/
|- bloc/
```

### Widget

Contains the common widgets that are shared across multiple screens. For example, Button, TextField, ListView, etc.

```
wiget/
|- title_widget.dart
```

### Domain

Domain is the inner layer which shouldn't be susceptible to the whims of changing data sources or porting our app to Angular Dart. It will contain only the core business logic (use cases) and business objects (entities). It should be totally independent of every other layer. A separate folder is created for each type as shown in example below:

```
domain/
|- api/
|- repo/
```

### Router

This file contains all the routes for your application.

```dart
import 'package:flutter/material.dart';

import 'feature/home/presentation/screen/home_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home-route':
        final String? title = settings.arguments as String;
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => HomeScreen(title!),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
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
          appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark)),
      darkTheme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: DSColor.primaryBlue,
          highlightColor: Colors.transparent,
          brightness: Brightness.dark,
          splashColor: Colors.transparent,
          appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light)),
      onGenerateRoute: Routers.generateRoute,
      initialRoute: '/home-route',
    );
  }
}
```

## Conclusion

This Boilerplate V2 has already use flutter null safety feature but still need more improvements. Please feel free to submit an issue and/or pull request.
