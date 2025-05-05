import 'package:flutter/material.dart';
import 'package:rickandmorty_app/widgets/separator.dart';

class PrincialCharactersWidget extends StatelessWidget {

  const PrincialCharactersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 400,
            child: Text("Personajes Principales" ,style: TextStyle(fontSize: 64, color: Colors.white),)),
          SeparatorWidget(size: 32),
          Container(width: 600, height: 1,color: Colors.white,),
          SeparatorWidget(size: 32),
          SizedBox(
            width: 800,
            child: Text("The show revolves around the adventures of the members of the Smith household, which consists of parents Jerry and Beth, their children Summer and Morty, and Beth's father, Rick Sanchez, who lives with them as a guest. The family lives in a suburb in the American Midwest. The adventures of Rick and Morty, however, take place across an infinite number of realities, with the characters traveling to other planets and dimensions through portals and Rick's flying saucer.",style: TextStyle(fontSize: 16, color: Colors.white),))
        ],
      ),
    );
  }
}