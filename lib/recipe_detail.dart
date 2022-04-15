import 'package:flutter/material.dart';
import 'package:papa_01/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderValue=1;
  double newValue=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(width: double.infinity, child: Image.asset(widget.recipe.imgUrl)),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.recipe.label,
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Palatino'),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (context, index) {
                  Ingredient i = widget.recipe.ingredients[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${index + 1}. "),
                          Text("Name : " + i.name),
                          const SizedBox(
                            width: 20,
                          ),
                          Text("${i.quantity*_sliderValue}"),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(i.measure),
                        ]),
                  );
                },
              ),
            ),
            Slider(
              value:_sliderValue.toDouble(),
              min:1,
              max:10,
              divisions: 10,
              onChanged: (newValue){
                setState(() {
                  _sliderValue=newValue.round();
                });
              },
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              label:"${_sliderValue * widget.recipe.servings} servings",
            )
          ],
        ),
      ),
    );
  }
}
