part of 'undo_bloc.dart';

@immutable
abstract class UndoState {}

class UndoInitial extends UndoState {}

class InitializedCounter extends UndoState {
  final String text;

  InitializedCounter(this.text);
}
