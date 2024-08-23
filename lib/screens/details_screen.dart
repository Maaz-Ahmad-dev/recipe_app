import 'package:dep_task_three/components/circle_button.dart';
import 'package:dep_task_three/components/custom_clip_path.dart';
import 'package:dep_task_three/components/ingredient_list.dart';
import 'package:dep_task_three/components/show_calories.dart';
import 'package:dep_task_three/constants/share.dart';
import 'package:dep_task_three/constants/start_cooking.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class DetailsScreen extends StatefulWidget {
  final Map<String, dynamic> item;
  const DetailsScreen({super.key, required this.item});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var mybox = Hive.box("saved");
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    int time = widget.item['totalTime'].toInt();
    List<dynamic> ing = widget.item['ingredientLines'];
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: h * 0.44,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.item['image']),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Positioned(
                      top: 15,
                      left: 15,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.red.withOpacity(0.7),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.item['label'],
                                style: TextStyle(
                                    fontSize: w * 0.05,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("$time min"),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              StartCooking.startCooking(widget.item['url']),
                          child: CircleAvatar(
                            radius: w * 0.065,
                            backgroundColor: Colors.red.shade400,
                            child: Icon(
                              Icons.play_arrow_outlined,
                              color: Colors.white,
                              size: w * 0.08,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: mybox.listenable(),
                          builder: (context, box, _) {
                            String key = widget.item['label'];
                            bool save = mybox.containsKey(key);
                            if (save) {
                              return GestureDetector(
                                onTap: () {
                                  mybox.delete(key);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          duration: Duration(seconds: 2),
                                          content: Text(
                                              "Recipe Deleted from saved")));
                                },
                                child: const CircleButton(
                                    icon: Icons.bookmark_added, label: "Save"),
                              );
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  mybox.put(key, key);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          duration: Duration(seconds: 2),
                                          content:
                                              Text("Recipe added to saved")));
                                },
                                child: const CircleButton(
                                    icon: Icons.bookmark_border, label: "Save"),
                              );
                            }
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            ShowCalories.showCals(
                                widget.item['totalNutrients'], context);
                          },
                          child: const CircleButton(
                              icon: Icons.monitor_heart_outlined,
                              label: "Calories"),
                        ),
                        GestureDetector(
                            onTap: () => ShareRecipe.share(widget.item['url']),
                            child: const CircleButton(
                                icon: Icons.share, label: "Share")),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Container(
                      color: Colors.white,
                      height: h * 0.07,
                      width: w,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: ClipPath(
                                clipper: CustomClipPath(),
                                child: Container(
                                  color: Colors.red.withOpacity(0.7),
                                  child: Center(
                                    child: Text(
                                      "Ingredient required",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: w * 0.05),
                                    ),
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text("${ing.length}\nItems"),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: h * 1.8,
                      child: IngredientList(
                          ingredients: widget.item['ingredients']),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
