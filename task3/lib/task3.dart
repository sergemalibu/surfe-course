//Имеется класс Phone для добавления телефонов с его характеристиками и ценой
//В нем есть два метода для звонков и описанием устройства
//В нем имеется вложеный объект Сamera c характеристикой камеры

class Phone {
  static const sim = true;
  final String model;
  final int weight;
  int? _price;
  final camera = Camera();

  Phone(this._price, {required this.model, required this.weight});

  int? get price => _price;

//позвонить
  callPhone(sim) {
    if (sim == true) {
      print('телефон звонит');
    } else {
      print('сим не активна');
    }
  }

//описание телефона
  phoneDescription() {
    print(
      'телефон: $model, камера ${camera.megapx} мегапикселей, активация сим: $sim баланс: $price руб',
    );
  }
}

class Camera {
  final int megapx = 10;
}

void main() {
  final iPhoneX = Phone(20000, model: 'iPhoneX', weight: 100);
  final samsung = Phone(15000, model: 'SamsungZ', weight: 120);

  iPhoneX.phoneDescription();
  samsung.phoneDescription();
  samsung.callPhone(Phone.sim);
}
