import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newspaper_app/feature/detail_news_screen/presentation/screen/detail_news_screen.dart';
import 'package:flutter_newspaper_app/feature/home/presentation/screen/home_screen.dart';
import 'package:flutter_newspaper_app/feature/login/presentation/screen/login_screen.dart';
import 'package:flutter_newspaper_app/feature/splash_screen/presentation/screen/splash_screen.dart';
import 'package:flutter_newspaper_app/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('home screen test', (WidgetTester tester) async {
    app.main();

    // logged in as guest
    await tester.pumpAndSettle();

    expect(find.byType(SplashScreen), findsOneWidget);

    await Future.delayed(const Duration(seconds: 3));

    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);

    await tester.tap(find.byKey(Key('continue_as_guest')));

    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);

    await Future.delayed(const Duration(seconds: 3));

    await tester.pumpAndSettle();

    final listNewsFinder = find.byType(Scrollable);
    expect(listNewsFinder, findsOneWidget);

    final itemNewsFinder = find.byKey(ValueKey('news_10'));
    await tester.scrollUntilVisible(
      itemNewsFinder,
      500,
      scrollable: listNewsFinder,
    );

    await tester.tap(find.byKey(Key('news_10')));

    await tester.tap(find.byKey(Key('guest_login_badge')));

    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);

    // logged in as user
    await tester.tap(find.byKey(Key('button_login')));

    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);

    await Future.delayed(const Duration(seconds: 3));

    await tester.pumpAndSettle();

    expect(listNewsFinder, findsOneWidget);

    await binding.traceAction(
      () async {
        await tester.scrollUntilVisible(
          itemNewsFinder,
          500,
          scrollable: listNewsFinder,
        );
      },
      reportKey: 'scrolling_timeline',
    );

    expect(itemNewsFinder, findsOneWidget);

    await tester.tap(find.byKey(Key('news_10')));

    await tester.pumpAndSettle();

    expect(find.byType(DetailNewsScreen), findsOneWidget);
  });
}
