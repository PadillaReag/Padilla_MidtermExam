import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('smoke test – builds a simple widget', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: Text('Skills'))),
    );
    expect(find.text('Skills'), findsOneWidget);
  });
}
