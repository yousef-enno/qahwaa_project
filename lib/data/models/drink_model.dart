abstract class DrinkModel {
  String get drinkName;
}

class Shai extends DrinkModel {
  @override
  String get drinkName => 'shai';
}

class TurkishCoffee extends DrinkModel {
  @override
  String get drinkName => 'turkishcoffee';
}

class Hibiscus extends DrinkModel {
  @override
  String get drinkName => 'hibiscus';
}
