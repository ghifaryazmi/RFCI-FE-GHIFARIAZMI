import 'dart:async';

import 'package:meta/meta.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'undo_event.dart';
part 'undo_state.dart';

class UndoBloc extends ReplayBloc<UndoEvent, UndoState> {
  UndoBloc() : super(UndoInitial());

  @override
  Stream<UndoState> mapEventToState(
    UndoEvent event,
  ) async* {
    if (event is Increment) {
      if (event is UndoInitial) {
        yield InitializedCounter("");
      } else {
        yield InitializedCounter(event.text);
      }
    }
  }
}
