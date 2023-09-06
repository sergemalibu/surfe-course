class Product {
  final int id;
  final String category;
  final String name;
  final int price;
  final int quantity;

  Product(this.id, this.category, this.name, this.price, this.quantity);

  @override
  String toString() {
    return '$id $category $name $price рублей $quantity шт';
  }
}

abstract class Filter {
  bool apply(Product product);
}

class CategoryFilter implements Filter {
  final String category;

  CategoryFilter(this.category);

  @override
  bool apply(Product product) {
    return product.category == category;
  }
}

class PriceFilter implements Filter {
  final int maxPrice;

  PriceFilter(this.maxPrice);

  @override
  bool apply(Product product) {
    return product.price <= maxPrice;
  }
}

class QuantityFilter implements Filter {
  final int maxQuantity;

  QuantityFilter(this.maxQuantity);

  @override
  bool apply(Product product) {
    return product.quantity < maxQuantity;
  }
}

applyFilter(List<Product> products, Filter filter) {
  return products.where((product) => filter.apply(product)).toList();
}

void main() {
  // Строковое представление товаров
  final articles = '''
    1,хлеб,Бородинский,500,5
    2,хлеб,Белый,200,15
    3,молоко,Полосатый кот,50,53
    4,молоко,Коровка,50,53
    5,вода,Апельсин,25,100
    6,вода,Бородинский,500,5
  ''';

  // Парсинг в список объектов Product
  final productLines = articles.trim().split('\n');

  final product_list = productLines.map((line) {
    final parts = line.split(',');

    return Product(int.parse(parts[0]), parts[1], parts[2], int.parse(parts[3]),
        int.parse(parts[4]));
  }).toList();

  // Фильтры
  final categoryFilter = CategoryFilter('хлеб');
  final priceFilter = PriceFilter(500);
  final quantityFilter = QuantityFilter(10);

  // Применение фильтров к продуктам
  final filteredByCategory = applyFilter(product_list, categoryFilter);
  final filteredByPrice = applyFilter(product_list, priceFilter);
  final filteredByQuantity = applyFilter(product_list, quantityFilter);

  // Вывод результатов
  print("Фильтрация по категории:");
  for (final product in filteredByCategory) {
    print(product);
  }

  print("\nФильтрация по цене:");
  for (final product in filteredByPrice) {
    print(product);
  }

  print("\nФильтрация по количеству:");
  for (final product in filteredByQuantity) {
    print(product);
  }
}
