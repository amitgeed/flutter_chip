import 'package:get/get.dart';

class ChipsController extends GetxController {
  var choices = List<String>().obs;

  void addChoice(String name) {
    choices.add(name);
  }

  void removeChoice(String name) {
    choices.remove(name);
  }
}
