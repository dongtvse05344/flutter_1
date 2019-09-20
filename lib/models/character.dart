import 'package:flutter/material.dart';

class Character {
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;

  Character({this.name, this.imagePath, this.description, this.colors});
}

List<Character> characters = [
  Character(
    name:'Kenvin',
    imagePath: 'assets/images/Kevin_minions.png',
    description: "I really love this look and feel! When it comes to interaction work though, I think you missed the crucial element of paginations in some sort. Either bullets in the bottom or cards peeking from either side etc. Then I also think that you should add a touch indicator to the clips card in the detail page to indicate that you can swipe that sheet up and down. Also one more detail in the main cards Click to read more' - We don't click, we tap, and I also think that you should change this copy to something else more valuable since it's very clear that you possibly could tap these :) Keep it up man!",
    colors: [Colors.orange.shade200, Colors.deepOrange.shade400]
  ),
  Character(
    name:'Agnes',
    imagePath: 'assets/images/Agnes_gru.png',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    colors: [Colors.pink.shade200, Colors.redAccent.shade400]
  ),
];