import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:munim_mobile/models/favorites.dart';
import 'package:munim_mobile/screens/favorites.dart';
import 'package:provider/provider.dart';

late Favorites favorite;

Widget createFavoritesPage() => ChangeNotifierProvider(
      create: (context) {
        favorite = Favorites();
        return favorite;
      },
      child: MaterialApp(
        home: FavoritesPage(),
      ),
    );

void addItems(int n) {
  for (int i = 0; i < n; i++) {
    favorite.add(i);
  }
}

void main() {
  group('Testing Favorites page', () {
    testWidgets('Test if ListView is loaded', (tester) async {
      await tester.pumpWidget(createFavoritesPage());
      addItems(3);
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Test remove button', (tester) async {
      await tester.pumpWidget(createFavoritesPage());
      addItems(5);
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
      expect(tester.widgetList(find.byType(ListTile)).length, 5);

      await tester.tap(find.byIcon(Icons.close).first);
      await tester.pumpAndSettle();
      expect(tester.widgetList(find.byType(ListTile)).length, 4);
      expect(find.text('Removed from favorites.'), findsOneWidget);
    });
  });
}
