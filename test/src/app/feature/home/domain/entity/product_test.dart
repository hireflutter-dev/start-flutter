import 'package:flutter_test/flutter_test.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/entity/product.dart';

void main() {
  group('product test', () {
    test('() default constructor', () {
      final Product product = Product();

      expect(product, Product());
    });

    test('() default constructor with default value', () {
      final Product product = Product(
        name: 'Laptop',
        id: 10,
      );

      expect(product.name, 'Laptop');
      expect(product.id, 10);
    });

    test('== equality', () {
      final Product product = Product(name: 'Laptop', id: 10);

      expect(product, Product(name: 'Laptop', id: 10));

      expect(
        Product(name: 'Laptop', id: 11),
        isNot(
          equals(
            Product(name: 'Computer', id: 10),
          ),
        ),
      );
    });
  });
}
