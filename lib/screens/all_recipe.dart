import 'package:dep_task_three/components/custom_appbar.dart';
import 'package:dep_task_three/constants/constant_function.dart';
import 'package:dep_task_three/screens/details_screen.dart';
import 'package:flutter/material.dart';

class AllRecipe extends StatelessWidget {
  final String recipe;
  const AllRecipe({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppbar(title: recipe, back: true),
      body: FutureBuilder(
        future: ConstantFunctions.getResponse(recipe),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text("No Data"),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(
                  top: h * 0.03, left: w * 0.034, right: w * 0.034),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.6 / 1,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> snap = snapshot.data![index];
                  int time = snap['totalTime'].toInt();
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.white30,
                              blurRadius: 2,
                              spreadRadius: 5,
                              offset: Offset(0, 3))
                        ]),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsScreen(item: snap))),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            snap['image'],
                                          ),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Container(
                                    height: 20,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.red.shade400,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Text(
                                        "$time min",
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 6,
                            ),
                            child: Text(
                              snap['label'],
                              style: TextStyle(
                                  fontSize: w * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
