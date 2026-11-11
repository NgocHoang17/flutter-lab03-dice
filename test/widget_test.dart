import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab03_dice/main.dart';

void main() {
  testWidgets('Lắc cập nhật hai ảnh 1–6 và tổng đúng', (tester) async {
    final expected = Random(42);
    await tester.pumpWidget(MaterialApp(home: DicePage(random: Random(42))));
    for (var i = 1; i <= 12; i++) {
      final left = expected.nextInt(6) + 1;
      final right = expected.nextInt(6) + 1;
      await tester.tap(find.byKey(const Key('roll')));
      await tester.pumpAndSettle();
      expect(find.byKey(ValueKey('trái-$left')), findsOneWidget);
      expect(find.byKey(ValueKey('phải-$right')), findsOneWidget);
      expect(
        tester.widget<Text>(find.byKey(const Key('total'))).data,
        '${left + right}',
      );
      expect(find.text('Đã lắc $i lần'), findsOneWidget);
    }
    expect(tester.takeException(), isNull);
  });
}
