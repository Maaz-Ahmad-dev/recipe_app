import 'package:flutter/material.dart';

class IngredientList extends StatelessWidget {
  final List<dynamic> ingredients;
  const IngredientList({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        double qty = ingredients[index]['quantity'] ?? 1.0;
        return IngredientItems(
            qty: qty.toStringAsFixed(2),
            measure: ingredients[index]['measure'] ?? "",
            food: ingredients[index]['food'] ?? "",
            url: ingredients[index]['image'] ?? "");
      },
    );
  }
}

class IngredientItems extends StatelessWidget {
  final String qty, measure, food, url;
  const IngredientItems(
      {super.key,
      required this.qty,
      required this.measure,
      required this.food,
      required this.url});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: h * 0.01, horizontal: w * 0.033),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            )
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              url,
              width: w * 0.2,
              height: h * 0.1,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: w * 0.04,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              Text(
                qty,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: w * 0.04,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              Text(
                measure,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: w * 0.04,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ],
          )),
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.add_circle_outline_rounded,
            size: w * 0.07,
            color: Colors.red.shade400,
          )
        ],
      ),
    );
  }
}
