/// Класс сравнения двух объектов
abstract class MyComparable<T> {

  bool operator <(T value);
  bool operator <=(T value);
  bool operator >(T value);
  bool operator >=(T value);

}
