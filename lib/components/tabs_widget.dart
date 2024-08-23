import 'package:dep_task_three/constants/constant_function.dart';
import 'package:dep_task_three/screens/details_screen.dart';
import 'package:flutter/material.dart';

class TabsWidget extends StatelessWidget {
  const TabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.transparent,
            height: h * 0.05,
            child: TabBar(
              unselectedLabelColor: Colors.red.shade400,
              labelColor: Colors.white,
              dividerColor: Colors.white,
              indicator: BoxDecoration(
                color: Colors.red.shade400,
                borderRadius: BorderRadius.circular(20),
              ),
              labelPadding: EdgeInsets.symmetric(
                horizontal: w * 0.012,
              ),
              tabs: const [
                TabItems(title: 'Breakfast'),
                TabItems(title: 'Lunch'),
                TabItems(title: 'Dinner'),
                TabItems(title: 'Quick'),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          SizedBox(
            height: h * 0.3,
            child: const TabBarView(
              children: [
                HomeTabBarView(recipe: 'breakfast'),
                HomeTabBarView(recipe: 'lunch'),
                HomeTabBarView(recipe: 'dinner'),
                HomeTabBarView(recipe: 'quick'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TabItems extends StatelessWidget {
  final String title;
  const TabItems({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red.shade400),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 10),
          ),
        ),
      ),
    );
  }
}

class HomeTabBarView extends StatelessWidget {
  final String recipe;
  const HomeTabBarView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: ConstantFunctions.getResponse(recipe),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text("No Data Found"),
          );
        } else {
          return SizedBox(
            height: h * 0.30,
            child: ListView.separated(
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 15,
                );
              },
              itemBuilder: (context, index) {
                Map<String, dynamic> snap = snapshot.data![index];
                int time = snap['totalTime'].toInt();
                int calories = snap['calories'].toInt();
                return Container(
                  margin: EdgeInsets.only(right: w * 0.02),
                  width: w * 0.5,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                            item: snap,
                                          )));
                            },
                            child: Container(
                              width: w,
                              height: h * 0.17,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(snap["image"]),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Text(
                            snap["label"],
                            style: TextStyle(
                                fontSize: w * 0.035,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Text(
                            "Cals :${calories.toString()} Mins :${time.toString()}",
                            style: TextStyle(
                              fontSize: w * 0.03,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
