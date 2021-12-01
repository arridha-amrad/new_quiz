import 'package:flutter/material.dart';
import 'package:new_quiz/models/question.dart';

class QuestionNumberWidget extends StatelessWidget {
  final List<Question> questions;
  final Question question;
  final ValueChanged<int> onClickedNumber;

  const QuestionNumberWidget({
    Key? key,
    required this.questions,
    required this.question,
    required this.onClickedNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: questions.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8.0),
        itemBuilder: (context, index) {
          bool isSelected = question == questions[index];
          return SizedBox(
            width: 50,
            height: 50,
            child: GestureDetector(
              onTap: () => onClickedNumber(index),
              child: CircleAvatar(
                backgroundColor:
                    isSelected ? Colors.amber.shade300 : Colors.white,
                child: Text((index + 1).toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}
