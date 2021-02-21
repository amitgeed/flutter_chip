class ChoiceState {
  final List<String> choices;

  ChoiceState({this.choices});

  factory ChoiceState.initial() => ChoiceState(choices: []);
}
