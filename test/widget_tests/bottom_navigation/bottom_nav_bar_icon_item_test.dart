import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cocktail/bottom_navigation/widgets/bottom_nav_bar_icon_item.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets(
    'BottomNavBarIconItem changes by tap the current active index and become active',
    (WidgetTester tester) async {
      var currentActiveIndex = 0;
      onTap(int i) {
        currentActiveIndex = i;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: BottomNavBarIconItem(
            currentActiveIndex: currentActiveIndex,
            itemIndex: 1,
            iconData: Icons.home,
            onTap: onTap,
          ),
        ),
      );
      await tester.pumpAndSettle();
      final stackFinder = find.byType(Stack);
      expect(stackFinder, findsOneWidget);

      final animatedContainer =
          tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));
      expect(animatedContainer.constraints!.biggest, const Size(30, 30));

      final tmp = find.byType(AnimatedContainer);

      await tester.tap(stackFinder.last);
      await tester.pump(const Duration(milliseconds: 500));
      expect(currentActiveIndex, 1);

      expect(animatedContainer.constraints!.biggest, const Size(50, 50));

      final animatedContainerBoxDecoration =
          animatedContainer.decoration as BoxDecoration;
      expect(animatedContainerBoxDecoration.color, Colors.grey.withOpacity(.5));
    },
  );
}
