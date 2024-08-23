import 'package:dep_task_three/components/custom_appbar.dart';
import 'package:dep_task_three/screens/all_recipe.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class SavedRecipe extends StatelessWidget {
  const SavedRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    var mybox = Hive.box("saved");
    return Scaffold(
      appBar: const CustomAppbar(title: "Saved", back: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: ValueListenableBuilder(
          valueListenable: mybox.listenable(),
          builder: (context, box, _) {
            return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  var data = box.values.toList();
                  return ListTile(
                    title: Container(
                      height: h * 0.085,
                      width: w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[300],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AllRecipe(
                                                recipe: data[index])));
                                  },
                                  child: Text(
                                    data[index],
                                  ))),
                          InkWell(
                            onTap: () {
                              mybox.delete(data[index]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      duration: Duration(seconds: 2),
                                      content:
                                          Text("Recipe removed from saved")));
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
