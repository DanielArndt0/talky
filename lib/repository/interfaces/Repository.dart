abstract class Repository<T> {
  List<T> findAll();
  List<T> where(bool Function(T element) condition);
  void remove(T element);
  void insert(T element);
  void removeWhere(bool Function(T element) condition);
}
