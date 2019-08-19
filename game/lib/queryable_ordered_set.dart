import 'package:flame/components/component.dart';
import 'package:ordered_set/comparing.dart';
import 'package:ordered_set/ordered_set.dart';
import 'package:pocket_dungeons/components/actor.dart';

class QueryableOrderedSet<T, E> extends OrderedSet<T> {

  Map<E, bool Function(T)> _fns = {};
  Map<E, List<T>> _cache = {};

  QueryableOrderedSet([int compare(T e1, T e2)]) : super(compare);

  void register(E e, bool Function(T) query) {
    _fns[e] = query;
    _cache[e] = _filter(_fns[e]);
  }

  List<T> query(E e) {
    return _cache[e];
  }

  @override
  bool add(T t) {
    if (super.add(t)) {
      _fns.keys.forEach((e) {
        if (_fns[e](t)) {
          _cache[e].add(t);
        }
      });
      return true;
    }
    return false;
  }

  @override
  int removeWhere(bool test(T element)) {
    _cache.values.forEach((v) => v.removeWhere(test));
    return super.removeWhere(test);
  }

  @override
  bool remove(T e) {
    _cache.values.forEach((v) => v.remove(e));
    return super.remove(e);
  }

  @override
  void clear() {
    _cache.values.forEach((v) => v.clear());
    super.clear();
  }

  List<T> _filter(bool Function(T) query) => this.where(query).toList();
}

enum Queries {
  Actor,
}

class QueryableOrderedSetImpl extends QueryableOrderedSet<Component, Queries> {
  QueryableOrderedSetImpl() : super(Comparing.on((c) => c.priority())) {
    this.register(Queries.Actor, (e) => e is Actor);
  }

  Iterable<Actor> actors() {
    return _postFilter<Actor>(Queries.Actor);
  }

  Iterable<T> _postFilter<T>(Queries e) {
    return query(e).cast();
  }
}