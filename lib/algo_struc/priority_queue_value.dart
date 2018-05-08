/// Значение очереди с приоритетом
import "my_comparable.dart";


class PriorityQueueValue<T> extends MyComparable<PriorityQueueValue> {

  /// Значение элемента очереди
  T value;
  // Приоритет элемента в очереди
  int priority;

  PriorityQueueValue(this.value, this.priority);

  @override
  bool operator <(PriorityQueueValue pqv) => this.priority <  pqv.priority;

  @override
  bool operator <=(PriorityQueueValue pqv) => this.priority <= pqv.priority;

  @override
  bool operator >(PriorityQueueValue pqv) => this.priority >  pqv.priority;

  @override
  bool operator >=(PriorityQueueValue pqv) => this.priority >= pqv.priority;

}
