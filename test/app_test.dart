import 'package:flutter/material.dart';
import 'package:flutter_newspaper_app/feature/home/presentation/screen/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_newspaper_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test Login', (WidgetTester tester) async {
    app.main();

    await tester.pump();
    await tester.pumpAndSettle(Duration(seconds: 4));

    Finder usernameTextfield = find.byKey(Key('usernameTextfield'));
    expect(usernameTextfield, findsOneWidget);
    await tester.enterText(usernameTextfield, 'admin');

    Finder passwordTextfield = find.byKey(Key('passwordTextfield'));
    expect(passwordTextfield, findsOneWidget);
    await tester.enterText(passwordTextfield, 'admin');

    await tester.tap(find.byKey(Key('buttonLogin')));

    await tester.pumpAndSettle(Duration(seconds: 4));

    expect(find.byType(SnackBar), findsNothing);
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
