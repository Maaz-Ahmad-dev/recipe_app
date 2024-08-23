import 'package:dep_task_three/screens/all_recipe.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 1),
            blurRadius: 2,
          )
        ],
      ),
      child: TextField(
        controller: search,
        style: TextStyle(
          fontSize: w * 0.04,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "What's cooking in your mind..??",
          hintStyle: TextStyle(color: Colors.grey, fontSize: w * 0.03),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllRecipe(recipe: search.text)));
              search.clear();
            },
            child: Icon(
              Icons.search,
              size: w * 0.07,
              color: Colors.red.shade400,
            ),
          ),
        ),
        onSubmitted: (value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AllRecipe(recipe: value)));
          search.clear();
        },
      ),
    );
  }
}
