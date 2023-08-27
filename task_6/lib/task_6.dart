/* Стоит задача фильтровать товары по разным характеристикам.
Нам необходимо реализовать функцию `applyFilter`, 
которая принимает два параметра: 
список товаров `List` и интерфейс фильтрации.

Интерфейс Filter — абстрактный класс с методом `apply`, 
принимает товар и возвращает `true`, если товар подходит под требования фильтра,
иначе `false`.

Начните с описания класса товара.

Затем напишите несколько реализаций интерфейса `Filter`, которые фильтрует товары
по категории;
по цене (не больше указанной);          
по количеству остатков на складе (меньше указанной).
Результат работы выведите в консоль в виде таблички:

столбцы разделены символом табуляции;
у цены указана валюта — рубли;
у количества единицы измерения — штуки.
Например, нужно вывести все товары, стоимость которой равно 500: */

/* 1 хлеб  Бородинский 500 рублей 5 шт
2 хлеб  Белый 500 рублей 15 шт */

//Интерфейс
import 'dart:convert';

abstract interface class Filter<T> {
  bool applyCategory(Products products, String filter);

  bool applyPrice(Products products, int filter);

  bool applyValue(Products products, int filter);
}

class Products implements Filter {
  final String id;
  final String name;
  final String category;
  final String price;
  final String value;

  Products(
    this.id,
    this.name,
    this.category,
    this.price,
    this.value,
  );
  @override
  bool applyCategory(Products product, String filter) {
    if (product.category == filter) {
      print('$id $category $name $price рублей $value шт');
    }
    return true;
  }

  @override
  bool applyPrice(Products product, int filter) {
    final int price = int.parse(product.price);
    if (price < filter) {
      print('$id $category $name $price рублей $value шт');
    }
    return false;
  }

  @override
  bool applyValue(Products product, int filter) {
    final value = int.parse(product.value);
    if (value < filter) {
      print('$id $category $name $price рублей $value шт');
    }
    return false;
  }
}

void main() {
  final articles = ''' 
1,хлеб,Бородинский,500,5
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5
''';
//переводим список в лист
  final lines = LineSplitter.split(articles);
  Products product;

  applyFilterCategory(productCategory) {
    for (var line in lines) {
      final line2 = line.split(',');
      product = Products(line2[0], line2[2], line2[1], line2[3], line2[4]);
      product.applyCategory(product, productCategory);
    }
  }

  applyFilterPrice(productPrice) {
    for (var line in lines) {
      final line2 = line.split(',');
      product = Products(line2[0], line2[2], line2[1], line2[3], line2[4]);
      product.applyPrice(product, productPrice);
    }
  }

  applyFilterValue(productValue) {
    for (var line in lines) {
      final line2 = line.split(',');
      product = Products(line2[0], line2[2], line2[1], line2[3], line2[4]);
      product.applyValue(product, productValue);
    }
  }

  //Категория
  applyFilterCategory('хлеб');
  //Прайс
  applyFilterPrice(100);
  //Остаток
  applyFilterValue(50);
}
