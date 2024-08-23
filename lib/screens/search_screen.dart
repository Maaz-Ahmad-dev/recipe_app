import 'package:dep_task_three/components/custom_appbar.dart';
import 'package:dep_task_three/constants/search_tags.dart';
import 'package:dep_task_three/components/search_widget.dart';
import 'package:dep_task_three/screens/all_recipe.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppbar(title: "Search", back: false),
      body: Padding(
        padding:
            EdgeInsets.symmetric(vertical: h * 0.016, horizontal: w * 0.032),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SearchWidget(),
            SizedBox(
              height: h * 0.04,
            ),
            Text(
              "Search Tags",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: w * 0.06,
              ),
            ),
            Wrap(
              spacing: 8,
              children: tags.map((label) {
                return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllRecipe(recipe: label)));
                    },
                    child: Text(label));
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
