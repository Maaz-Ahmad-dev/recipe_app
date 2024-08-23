import 'package:dep_task_three/components/home_app_bar.dart';
import 'package:dep_task_three/components/search_widget.dart';
import 'package:dep_task_three/components/tabs_widget.dart';
import 'package:dep_task_three/constants/images_path.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeAppBar(),
            SizedBox(
              height: h * 0.022,
            ),
            const SearchWidget(),
            SizedBox(
              height: h * 0.022,
            ),
            Container(
              height: h * 0.25,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cook the Best\nrecipes at\nhome",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: w * 0.065,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 7),
                                child: Text(
                                  "Explore",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: w * 0.04,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 2,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: w * 0.23,
                          backgroundImage: AssetImage(
                            ImagesPath.chef,
                          ),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h * 0.022,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                      fontSize: w * 0.045, fontWeight: FontWeight.bold),
                ),
                const Text("see all"),
              ],
            ),
            SizedBox(
              height: h * 0.022,
            ),
            const TabsWidget(),
          ],
        ),
      )),
    );
  }
}
