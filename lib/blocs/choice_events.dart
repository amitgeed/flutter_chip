abstract class ChoiceEvent {}

class AddChoice extends ChoiceEvent {
  final String name;
  AddChoice(this.name);
}

class RemoveChoice extends ChoiceEvent {
  final String name;
  RemoveChoice(this.name);
}
