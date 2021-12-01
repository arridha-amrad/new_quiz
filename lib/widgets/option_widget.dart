import 'package:flutter/material.dart';
import 'package:new_quiz/models/option.dart';
import 'package:new_quiz/models/question.dart';
import 'package:new_quiz/utils.dart';

class OptionWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;

  const OptionWidget({
    Key? key,
    required this.question,
    required this.onClickedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: Utils.heightBetween(
        question.options
            .map((option) => _buildOption(context, option))
            .toList(),
        height: 8,
      ),
    );
  }

  Color _getCorrectColor(Question question, Option option) {
    final isSelected = option == question.selectedOption;
    if (!isSelected) {
      return Colors.grey.shade200;
    }
    return option.isCorrect ? Colors.green.shade200 : Colors.red.shade200;
  }

  Widget _buildOption(BuildContext context, Option option) {
    Color color = _getCorrectColor(question, option);
    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10.0)),
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Column(
            children: [
              _buildAnswer(option, context),
              _buildSolution(question.selectedOption, option),
            ],
          )),
    );
  }

  Widget _buildSolution(Option? solution, Option answer) {
    if (solution != null && solution == answer) {
      return Text(
        question.solution,
        style: const TextStyle(fontSize: 16.0),
      );
    } else {
      return Container();
    }
  }

  Widget _buildAnswer(Option option, BuildContext context) {
    return Row(
      children: [
        Text(
          option.code + ". ",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          option.text,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        )
      ],
    );
  }
}
