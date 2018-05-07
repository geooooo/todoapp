/// Значение очереди с приоритетом
class PriorityQueueValue<T> {

  /// Значение элемента очереди
  T value;
  // Приоритет элемента в очереди
  int priority;

  PriorityQueueValue(this.value, this.priority);

  bool operator  <(PriorityQueueValue pqv) => this.priority <  pqv.priority;
  bool operator <=(PriorityQueueValue pqv) => this.priority <= pqv.priority;
  bool operator  >(PriorityQueueValue pqv) => this.priority >  pqv.priority;
  bool operator >=(PriorityQueueValue pqv) => this.priority >= pqv.priority;

}
