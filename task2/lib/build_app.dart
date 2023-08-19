void main() {
  final ageAgriculturalMachinery = <int>[];
  final age50AgriculturalMachinery = <int>[];
  final dateTime = DateTime.now();
  final int middleAgeAll;
  final int middleAgeOld;
  final int sumAge;
  final int half;
  int ageMachinery;
  final mapMachinery = {};

final mashineris = [...mapBefore2010.values, ...mapAfter2010.values];

  for (final e in mashineris) {
    for (final territory in e) {
      //Получаем дату выпуска техники
      for (final agriculturalMachinery in territory.machineries) {
        mapMachinery.addAll({
          agriculturalMachinery.hashCode: agriculturalMachinery.releaseDate
        });
      }
    }
  }

  for (var element in mapMachinery.values) {
    //Получаем возраст технини
    ageMachinery = dateTime.year - element.year as int;
    //Добавляем в лист возраст техники
    ageAgriculturalMachinery.add(ageMachinery);
  }

  //Сложение всех возрастов техники
  sumAge = ageAgriculturalMachinery.reduce(
    (value, element) => value + element,
  );
  //получаем средний возраст всей техники
  middleAgeAll = sumAge ~/ ageAgriculturalMachinery.length;

  //Сортируем технику от старой к новой
  ageAgriculturalMachinery.sort((b, a) => a.compareTo(b));

  //Получаем значение половины списка
  half = ageAgriculturalMachinery.length ~/ 2;

  //Добавляем в новый список значения половины списка
  age50AgriculturalMachinery.addAll(ageAgriculturalMachinery.take(half));

  //получаем средний возраст половины старой техники
  middleAgeOld = sumAge ~/ age50AgriculturalMachinery.length;

  print('Средний возраст всей техники в годах: $middleAgeAll ');
  print('Средний возраст старой техники в годах: $middleAgeOld ');
}

enum Countries { brazil, russia, turkish, spain, japan }

class Territory {
  int areaInHectare;
  List<String> crops;
  List<AgriculturalMachinery> machineries;

  Territory(
    this.areaInHectare,
    this.crops,
    this.machineries,
  );
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
    this.id,
    this.releaseDate,
  );

  // Переопределяем оператор "==", что бы сравнивать объекты по значению
  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      ['Чай'],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        )
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      ['Арбузы'],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      ['Табак'],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};
