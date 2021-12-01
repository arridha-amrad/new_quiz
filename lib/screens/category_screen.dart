import 'package:flutter/material.dart';
import 'package:new_quiz/models/category.dart';
import 'package:new_quiz/models/option.dart';
import 'package:new_quiz/models/question.dart';
import 'package:new_quiz/screens/question_widget.dart';
import 'package:new_quiz/widgets/question_number.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;
  const CategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late PageController pageController;
  late Question question;

  @override
  void initState() {
    pageController = PageController();
    question = widget.category.questions.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(widget.category.categoryName),
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange, Colors.purple],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        )),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: QuestionNumberWidget(
                questions: widget.category.questions,
                question: question,
                onClickedNumber: (int index) =>
                    _nextQuestion(index: index, jump: true)),
          ),
        ),
      ),
      body: QuestionWidget(
        pageController: pageController,
        category: widget.category,
        onClickedOption: _selectOption,
        onPageChanged: (int? index) => _nextQuestion(index: index),
      ),
    );
  }

  void _nextQuestion({int? index, jump = false}) {
    final nextPage = pageController.page! + 1;
    final indexPage = index ?? nextPage.toInt();
    setState(() {
      question = widget.category.questions[indexPage];
    });
    if (jump) {
      pageController.jumpToPage(indexPage);
    }
  }

  void _selectOption(Option option) {
    if (question.isLocked! == true) {
      return;
    } else {
      setState(() {
        question.isLocked = true;
        question.selectedOption = option;
      });
    }
  }
}
