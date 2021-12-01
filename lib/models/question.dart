import 'option.dart';

class Question {
  String text;
  List<Option> options;
  String solution;
  bool? isLocked;
  Option? selectedOption;

  Question({
    required this.text,
    required this.options,
    required this.solution,
    this.isLocked = false,
    this.selectedOption,
  });
}
