import 'package:dep_task_three/components/categories_list.dart';
import 'package:dep_task_three/constants/category_list.dart';
import 'package:dep_task_three/screens/all_recipe.dart';
import 'package:flutter/material.dart';

class RecipeCategory extends StatelessWidget {
  const RecipeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                "For You",
                style:
                    TextStyle(fontSize: w * 0.065, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              mainCategories(h),
              SizedBox(
                height: h * 0.015,
              ),
              Text(
                "Categories",
                style:
                    TextStyle(fontSize: w * 0.045, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: h * 0.015,
              ),
              allCategories(h, w),
              SizedBox(
                height: h * 0.015,
              ),
              Text(
                "Your Preferences",
                style:
                    TextStyle(fontSize: w * 0.045, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: h * 0.015,
              ),
              mainCategories(h),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox allCategories(double h, double w) {
    return SizedBox(
      height: h * 0.40,
      child: GridView.builder(
        itemCount: catName.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: h * 0.01,
            mainAxisSpacing: w * 0.021),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AllRecipe(
                          recipe: catName[index],
                        ))),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h * 0.043,
                    width: w * 0.08,
                    child: Image.asset(
                      catImgs[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.003,
                  ),
                  Text(
                    catName[index],
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black45),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox mainCategories(double h) {
    return SizedBox(
      height: h * 0.106,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CategoriesList(
            name: names[0],
            image: images[0],
          ),
          CategoriesList(
            name: names[1],
            image: images[1],
          ),
          CategoriesList(
            name: names[2],
            image: images[2],
          ),
          CategoriesList(
            name: names[3],
            image: images[3],
          ),
        ],
      ),
    );
  }
}
