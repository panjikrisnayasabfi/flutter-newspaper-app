import 'package:flutter/material.dart';
import 'package:flutter_newspaper_app/feature/home/presentation/screen/home_screen.dart';
import 'package:flutter_newspaper_app/feature/login/presentation/screen/login_screen.dart';
import 'package:flutter_newspaper_app/feature/splash_screen/presentation/screen/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_newspaper_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test Login', (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();

    expect(find.byType(SplashScreen), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 3));

    expect(find.byType(LoginScreen), findsOneWidget);

    Finder usernameTextfield = find.byKey(Key('usernameTextfield'));
    expect(usernameTextfield, findsOneWidget);
    await tester.enterText(usernameTextfield, 'admin');

    Finder passwordTextfield = find.byKey(Key('passwordTextfield'));
    expect(passwordTextfield, findsOneWidget);
    await tester.enterText(passwordTextfield, 'admin');

    await tester.tap(find.byKey(Key('buttonLogin')));
  });
}
