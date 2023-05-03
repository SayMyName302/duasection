import 'package:duasection/customwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomVerticalCardList widget', () {
    testWidgets('renders a list of cards', (WidgetTester tester) async {
      final List<Map<String, dynamic>> data = [
        {'screen': 'screen1', 'image': 'assets/1.PNG', 'text': 'Card 1'},
        {'screen': 'screen2', 'image': 'assets/1.PNG', 'text': 'Card 2'},
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomVerticalCardList(data: data),
          ),
        ),
      );

      // Find the cards in the widget tree
      final card1 = find.text('Card 1');
      final card2 = find.text('Card 2');

      // Expect both cards to be present in the widget tree
      expect(card1, findsOneWidget);
      expect(card2, findsOneWidget);
    });

    testWidgets('navigates to the correct screen when a card is tapped',
        (WidgetTester tester) async {
      final List<Map<String, dynamic>> data = [
        {'screen': 'screen1', 'image': 'assets/1.PNG', 'text': 'Card 1'},
        {'screen': 'screen2', 'image': 'assets/1.PNG', 'text': 'Card 2'},
      ];

      // Define a mock navigator to intercept navigation events
      final navigatorKey = GlobalKey<NavigatorState>();
      final mockNavigatorObserver = MockNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigatorKey,
          navigatorObservers: [mockNavigatorObserver],
          home: Scaffold(
            body: CustomVerticalCardList(data: data),
          ),
        ),
      );

      // Find the first card and simulate a tap
      final card1 = find.text('Card 1');
      expect(card1, findsOneWidget);
      await tester.tap(card1);
      await tester.pumpAndSettle();

      // Expect that the navigator received the correct route
      expect(mockNavigatorObserver.history.last.settings.name, 'screen1');
    });
  });
}

class MockNavigatorObserver extends NavigatorObserver {
  final List<Route<dynamic>> history = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    history.add(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    history.remove(route);
  }
}
