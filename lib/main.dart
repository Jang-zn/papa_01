import 'package:flutter/material.dart';
import 'package:papa_01/recipe.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  Recipe recipe = Recipe("label","image path");

  List<Recipe> recipeList = [
    Recipe("label1","image path1"),
    Recipe("label2","image path2"),
    Recipe("label3","image path3"),
    Recipe("label4","image path4"),
    Recipe("label5","image path5"),
    Recipe("label6","image path6"),
    Recipe("label7","image path7"),
    Recipe("label8","image path8"),
  ];

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("recipe app"),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return Text(recipeList[index].label??"default");
      })
    );
  }
}
