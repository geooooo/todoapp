import "../bin_heap/bin_heap.dart";
import "priority_queue_value.dart";


/// Очередь с приоритетами
class PriorityQueue<T> {

  /// Данные, хранящиеся в очереди
  BinHeap<PriorityQueueValue<T>> _data = new BinHeap<PriorityQueueValue<T>>();

  /// Итератор очереди
  BinHeap get iterator => this._data.iterator;

  /// Вставка значения [value] с приоритетом [priorityIndex]
  /// в очередь
  void insert(int priorityIndex, T value) {
    this._data.add(new PriorityQueueValue(value, priorityIndex));
  }

  /// Удаление значения с индексом [valueIndex]
  /// из очереди
  void delete(int valueIndex) {
    this._data.delete(valueIndex);
  }

  /// Извлечение максимального значения очереди
  PriorityQueueValue<T> popMax() => this._data.popMax();

}
