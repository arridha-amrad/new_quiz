import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_quiz/models/category.dart';
import 'package:new_quiz/screens/category_screen.dart';

class CategoryHeader extends StatelessWidget {
  final Category category;
  const CategoryHeader({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CategoryScreen(category: category),
      )),
      child: Container(
        decoration: BoxDecoration(
          color: category.backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              category.icon,
              color: Colors.white,
              size: MediaQuery.of(context).size.width / 7,
            ),
            const SizedBox(height: 12.0),
            Text(
              category.categoryName,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
