import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_quiz/data/categories.dart';
import 'package:new_quiz/data/user.dart';
import 'package:new_quiz/screens/category_screen.dart';
import 'package:new_quiz/widgets/category_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text("School quiz"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.deepOrange, Colors.purple],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
        ),
        bottom: PreferredSize(
            child: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: _buildWelcome(username)),
            preferredSize: const Size.fromHeight(80.0)),
      ),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 8.0),
          _buildCategories(),
          const SizedBox(height: 8.0),
          _buildPopular(),
        ],
      ),
    );
  }

  Widget _buildWelcome(String username) {
    return Builder(builder: (context) {
      return Column(
        children: [
          Text(
            "Hello",
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.white,
                ),
          ),
          Text(
            username,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
          )
        ],
      );
    });
  }

  Widget _buildCategories() {
    return Builder(builder: (context) {
      return SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: GridView(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            children: categories
                .map((category) => CategoryHeader(category: category))
                .toList(),
          ));
    });
  }

  Widget _buildPopular() {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12.0),
          SizedBox(
            height: 250,
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: categories
                  .map((category) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CategoryScreen(category: category),
                          )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width * 0.65,
                                decoration: BoxDecoration(
                                    color: category.backgroundColor,
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: DecorationImage(
                                        image: AssetImage(category.imageUrl))),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                category.categoryName,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              const SizedBox(height: 5.0),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Text(
                                  category.description ?? "",
                                  softWrap: true,
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      );
    });
  }
}
