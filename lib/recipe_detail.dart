
import 'package:flutter/material.dart';
import 'package:papa_01/recipe.dart';

class RecipeDetail extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(recipe.label),
      ),
      body:Column(
        children:[
          SizedBox(
              width:double.infinity,
              child: Image.asset(recipe.imgUrl)),
          const SizedBox(
            height: 10,
          ),
          Text(
            recipe.label,
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino'),
          ),
        ]
      )
    );
  }
}
