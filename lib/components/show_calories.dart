import 'package:flutter/material.dart';

class ShowCalories {
  static Future showCals(Map<String, dynamic> item, BuildContext context) {
    int fat = item['FAT']["quantity"].toInt();
    int sFat = item['FASAT']["quantity"].toInt();
    int cholestrol = item['CHOLE']["quantity"].toInt();
    int na = item['NA']["quantity"].toInt();
    int carbs = item['CHOCDF.net']["quantity"].toInt();
    int sugar = item['SUGAR']["quantity"].toInt();
    int protien = item['PROCNT']["quantity"].toInt();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.red.shade400,
          title: const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: Text(
                'Nutritionla Fact',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          content: Container(
            height: 300,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Fats:"),
                      Text(fat.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Saturated Fats:"),
                      Text(sFat.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Cholestrol:"),
                      Text(cholestrol.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Sodium:"),
                      Text(na.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Carbohydrates:"),
                      Text(carbs.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Sugar:"),
                      Text(sugar.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Protiens:"),
                      Text(protien.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
