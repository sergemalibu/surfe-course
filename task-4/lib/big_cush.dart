class PokerPlayer {
  /// Список текущих карт в руке у игрока
  List<String> _currentHand = ['King of clubs', 'Nine of hearts'];

  /// Субъективная оценка выигрыша
  double _surenessInWin = 0;

  /// Вычислить шансы на выигрыш
  void calculateProbabilities(List<String> cardOnDesk, Strategy strategy) =>
      _surenessInWin = strategy(cardOnDesk, _currentHand);
}

typedef Strategy = Function(List<String> p0, List<String> p1);

//class Strategy {}

void main() {
  final opponent = PokerPlayer();
  Strategy strategy;
  strategy = (p0, p1) {
    for (var element in p0) {
      print(element);
    }
  };

  /// Опишите его.
  fakeStrategy(p0, p1) {
    /// Ваш код - здесь
    strategy(p0, p1);
    return 0.0;
  }

  opponent.calculateProbabilities(
    ['Nine of diamonds', 'king of hearts'],
    fakeStrategy,
  );
}
