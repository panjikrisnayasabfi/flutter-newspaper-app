import 'package:flutter/material.dart';
import 'package:flutter_newspaper_app/feature/home/presentation/screen/home_screen.dart';
import 'package:flutter_newspaper_app/feature/login/presentation/screen/login_screen.dart';
import 'package:flutter_newspaper_app/feature/splash_screen/presentation/screen/splash_screen.dart';
import 'package:flutter_newspaper_app/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Guest test', (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();

    expect(find.byType(SplashScreen), findsOneWidget);

    await Future.delayed(const Duration(seconds: 3));

    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);

    await tester.tap(find.byKey(Key('buttonGuest')));

    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);

    await Future.delayed(const Duration(seconds: 3));

    await tester.pumpAndSettle();

    final listNewsFinder = find.byType(Scrollable);
    expect(listNewsFinder, findsOneWidget);

    final itemNewsFinder = find.byKey(ValueKey('news_7'));
    await binding.traceAction(
      () async {
        await tester.scrollUntilVisible(
          itemNewsFinder,
          100,
          scrollable: listNewsFinder,
        );
      },
      reportKey: 'scrolling_timeline',
    );

    expect(itemNewsFinder, findsOneWidget);

    // await tester.tap(find.byKey(Key('news_10')));

    // await tester.pumpAndSettle();

    // expect(find.byType(DetailNewsScreen), findsOneWidget);
  });
}
