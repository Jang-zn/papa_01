import 'package:flutter/material.dart';
import 'package:papa_01/recipe.dart';
import 'package:papa_01/recipe_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  Recipe recipe = Recipe("label", "image path");

  List<Recipe> recipeList = [
    Recipe("label1", "assets/dduk.jpg"),
    Recipe("label2", "assets/dduk.jpg"),
    Recipe("label3", "assets/dduk.jpg"),
    Recipe("label4", "assets/dduk.jpg"),
    Recipe("label5", "assets/dduk.jpg"),
    Recipe("label6", "assets/dduk.jpg"),
    Recipe("label7", "assets/dduk.jpg"),
    Recipe("label8", "assets/dduk.jpg"),
  ];

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("recipe app"),
        ),
        body: ListView.builder(
            itemCount: recipeList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          //TODO return RecipeDetail();
                          return const RecipeDetail();
                        },
                      ),
                    );
                  },
                  child: buildRecipe(recipeList[index]));
            }));
  }

  Widget buildRecipe(Recipe recipe) {
    return Card(
        elevation: 3.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset(recipe.imgUrl!),
              const SizedBox(
                height: 10,
              ),
              Text(
                recipe.label!,
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Palatino'),
              ),
            ],
          ),
        ));
  }
}
