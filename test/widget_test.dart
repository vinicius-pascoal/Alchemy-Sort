// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:alchemy_sort/app/app_widget.dart';

void main() {
  testWidgets('Mostra tela inicial do Alchemy Sort', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const AppWidget());

    expect(find.text('Alchemy Sort'), findsOneWidget);
    expect(find.text('Jogar'), findsOneWidget);
    expect(find.text('Fases'), findsOneWidget);
  });
}
