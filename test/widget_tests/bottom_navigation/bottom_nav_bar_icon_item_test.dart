import 'package:flutter/material.dart';
import 'package:flutter_cocktail/bottom_navigation/widgets/animated_bottom_nav_bar_icon_item.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('AnimatedBottomNavBarIconItem', () {
    Widget wrapWithMaterialApp(AnimatedBottomNavBarIconItem navBarIcon) =>
        MaterialApp(home: navBarIcon);

    AnimatedBottomNavBarIconItem getInactiveNavBarIcon() =>
        AnimatedBottomNavBarIconItem(
          currentActiveIndex: 0,
          itemIndex: 1,
          iconData: Icons.home,
          onTap: (_) {},
        );

    testWidgets('should be shown', (WidgetTester tester) async {
      //initialize
      final navBarIcon = getInactiveNavBarIcon();

      //act
      await tester.pumpWidget(wrapWithMaterialApp(navBarIcon));

      //expect
      expect(find.byType(AnimatedBottomNavBarIconItem), findsOneWidget);
    });

    testWidgets(
        'should contain a Stack with AnimatedContainer and SizedBox inside',
        (WidgetTester tester) async {
      //initialize
      final navBarIcon = getInactiveNavBarIcon();

      //act
      await tester.pumpWidget(wrapWithMaterialApp(navBarIcon));
      final stackWidget = find.byType(Stack);

      //expect
      expect(find.byType(Stack), findsOneWidget);
      expect(find.byType(AnimatedContainer), findsOneWidget);
      //expect(find.byType(SizedBox), findsOneWidget);
    });

    /*testWidgets(
        'inactive state should contain a BoxDecoration with transparent color',
        (WidgetTester tester) async {
      //initialize
      final navBarIcon = getInactiveNavBarIcon();

      //act
      await tester.pumpWidget(wrapWithMaterialApp(navBarIcon));
      final foundWidget = tester.widget<AnimatedBottomNavBarIconItem>(
          find.byType(AnimatedBottomNavBarIconItem));

      //expect
      expect(foundWidget.)
    });*/
  });
}
