part of 'undo_bloc.dart';

@immutable
abstract class UndoEvent extends ReplayEvent {}

class Increment extends UndoEvent {
  final String text;
  Increment(this.text);
}
