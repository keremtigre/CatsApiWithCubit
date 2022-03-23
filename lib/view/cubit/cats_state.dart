part of 'cats_cubit.dart';

abstract class CatsState {}

class CatsInitial extends CatsState {
  CatsInitial();
}

class CatsLoading extends CatsState {
  CatsLoading();
}

class CatsCompleted extends CatsState {
  List<Cat> cats;
  CatsCompleted(this.cats);
}

class CatsError extends CatsState {
  String message;
  CatsError(this.message);
}
