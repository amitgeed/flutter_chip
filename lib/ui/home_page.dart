import 'package:flutter/material.dart';
import 'package:flutter_chips/controllers/chips_controller.dart';
import 'package:flutter_chips/models/choice_model.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ChipsController _chipsController = Get.put(ChipsController());

  final List<ChoiceModel> _choice = [
    ChoiceModel('Arts & culture'),
    ChoiceModel('Business & finance'),
    ChoiceModel('Careers'),
    ChoiceModel('Entertainment'),
    ChoiceModel('Fashion & beauty'),
    ChoiceModel('Fitness'),
    ChoiceModel('Food'),
    ChoiceModel('Gaming'),
    ChoiceModel('Home & family'),
    ChoiceModel('Music'),
    ChoiceModel('News'),
    ChoiceModel('Nature'),
    ChoiceModel('Politics'),
    ChoiceModel('Science'),
    ChoiceModel('Sports'),
    ChoiceModel('Relationships'),
    ChoiceModel('Technology'),
    ChoiceModel('Travel'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chip Layout'),
      ),
      body: GetX<ChipsController>(builder: (controller) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Wrap(
                children: choiceChipWidget.toList(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Selected Category : ${controller.choices}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Iterable<Widget> get choiceChipWidget sync* {
    for (final ChoiceModel choice in _choice) {
      yield Padding(
        padding: EdgeInsets.all(4.0),
        child: FilterChip(
          showCheckmark: false,
          selectedColor: Colors.blue,
          label: Text(choice.name),
          selected: _chipsController.choices.contains(choice.name),
          onSelected: (bool value) {
            if (value) {
              // _choiceBloc.choiceEventSink.add(AddChoice(choice.name));
              _chipsController.addChoice(choice.name);
            } else {
              // _choiceBloc.choiceEventSink.add(RemoveChoice(choice.name));
              _chipsController.removeChoice(choice.name);
            }
          },
        ),
      );
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _choiceBloc.dispose();
  // }
}
