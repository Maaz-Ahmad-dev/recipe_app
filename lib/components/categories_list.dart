import 'package:dep_task_three/screens/all_recipe.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  final String name, image;
  const CategoriesList({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => AllRecipe(recipe: name))),
      child: SizedBox(
        height: h * .105,
        width: w * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: h * 0.07,
              width: w * 0.15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(image)),
              ),
            ),
            Center(
              child: Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black45),
              ),
            )
          ],
        ),
      ),
    );
  }
}
