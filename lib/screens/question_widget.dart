import 'package:flutter/material.dart';
import 'package:new_quiz/models/category.dart';
import 'package:new_quiz/models/option.dart';
import 'package:new_quiz/models/question.dart';
import 'package:new_quiz/widgets/option_widget.dart';

class QuestionWidget extends StatelessWidget {
  final ValueChanged<Option> onClickedOption;
  final ValueChanged<int> onPageChanged;
  final PageController pageController;
  final Category category;

  const QuestionWidget({
    Key? key,
    required this.category,
    required this.onClickedOption,
    required this.onPageChanged,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          final questions = category.questions[index];
          return _buildQuestion(question: questions, context: context);
        },
      ),
    );
  }

  Widget _buildQuestion(
      {required Question question, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            question.text,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.black),
          ),
          const SizedBox(height: 10.0),
          const Text("Choose your answer below"),
          const SizedBox(height: 20.0),
          Expanded(
              child: OptionWidget(
            question: question,
            onClickedOption: onClickedOption,
          ))
        ],
      ),
    );
  }
}
