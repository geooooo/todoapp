import "my_comparable.dart";


/// Двоичная куча
class BinHeap<T extends MyComparable> {

  /// Данные, хранящиеся в куче
  List<T> _data = <T>[];

  // ========== public методы ========== //

  /// Добавление значения [value] в кучу
  void add(T value) {
    this._data.add(value);
    this._siftUp(this._data.length - 1);
  }

  /// Удаление значения из кучи
  /// с индексом [index]
  void delete(int index) {
    this._data[index] = this._data.last;
    this._data.removeLast();
    this._siftDown(index);
  }

  /// Извлечение максимального значения из кучи
  T popMax() {
    if (this._data.isEmpty) return null;
    T result = this.max;
    this.delete(0);
    return result;
  }

  /// Вернуть элемент с максимальным приоритетом
  T get max {
    try {
      return this._data.first;
    } catch (StateError) {
      return null;
    }
  }

  /// Преобразование кучи в одномерный массив
  List<T> toList() {
    return new List.from(this._data);
  }

  // ========== private методы ========== //

  /// Восстановление свойств кучи
  /// проталкиванием вниз элемента с индексом [index]
  void _siftDown(int index) {
    int left  = 2 * index + 1;
    int right = 2 * index + 2;
    int largest = index;
    if (left < this._data.length &&
        this._data[left] > this._data[index]) {
      largest = left;
    }
    if (right < this._data.length &&
        this._data[right] > this._data[largest]) {
      largest = right;
    }
    if (largest != index) {
      this._swapData(index, largest);
      this._siftDown(largest);
    }
  }

  /// Восстановление свойств кучи
  /// проталкиванием вверх элемента с индексом [index]
  void _siftUp(int index) {
    while (index > 0) {
      int parent = (index - 1) ~/ 2;
      if (this._data[index] <= this._data[parent]) return;
      this._swapData(index, parent);
      index = parent;
    }
  }

  /// Обмен значений двух элементов кучи
  /// с указанными индексами [index1] и [index2]
  void _swapData(int index1, int index2) {
    T tmp = this._data[index1];
    this._data[index1] = this._data[index2];
    this._data[index2] = tmp;
  }

}
