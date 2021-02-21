import 'dart:async';

import 'package:flutter_chips/blocs/choice_events.dart';

class ChoiceBloc {
  List<String> _filters = <String>[];

  final _choiceStateController = StreamController<List<String>>();

  StreamSink<List<String>> get _inChoice => _choiceStateController.sink;

  Stream<List<String>> get choices => _choiceStateController.stream;

  final _choiceEventController = StreamController<ChoiceEvent>();
  // For events, exposing only a sink which is an input
  Sink<ChoiceEvent> get choiceEventSink => _choiceEventController.sink;

  // ignore: non_constant_identifier_names
  CounterBloc() {
    _choiceEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ChoiceEvent event) {
    if (event is AddChoice) {
      _filters.add(event.name);
      print('--------------------------------------');
      print(event.name);
      print('--------------------------------------');
    } else if (event is RemoveChoice) {
      print('--------------------------------------');
      print(event.name);
      print('--------------------------------------');
      _filters.remove(event.name);
    }

    _inChoice.add(_filters);
  }

  void dispose() {
    _choiceStateController.close();
    _choiceEventController.close();
  }
}

// ChioceBloc(ChoiceState initialState) : super(initialState);

// void onAdd() {
//   dispatch(AddChoice());
// }
// void onRemove() {
//   dispatch(RemoveChoice());
// }

// @override
// ChoiceState get initialState => ChoiceState.initial();

// @override
// Stream<ChoiceState> mapEventToState(ChoiceEvent event) async* {
//   final _currentState = currentState;
//   if(event is AddChoice){
//     yield ChoiceState()
//   }
// }
