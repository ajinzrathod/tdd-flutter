import 'package:flutter_test/flutter_test.dart';
import 'package:munim_mobile/models/favorites.dart';

void main() {
  group('Testing App Provider', () {
    Favorites favorites = Favorites();

    test('New item should be added', () {
      int number = 35;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
    });

    test('Remove an item', () {
      int number = 2213;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });
}