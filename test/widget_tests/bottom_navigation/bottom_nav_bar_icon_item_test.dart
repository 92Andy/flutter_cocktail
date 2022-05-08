import 'package:flutter/material.dart';
import 'package:flutter_cocktail/bottom_navigation/widgets/bottom_nav_bar_icon_item.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets(
    'BottomNavBarIconItem has an active index, '
    'an item index, an icon-data and an onTap Function(int).',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BottomNavBarIconItem(
            currentActiveIndex: 0,
            itemIndex: 0,
            iconData: Icons.home,
            onTap: (int i) {},
          ),
        ),
      );
      await tester.pumpAndSettle();
      final stackFinder = find.byType(Stack);
      expect(stackFinder, findsOneWidget);
    },
  );
}
