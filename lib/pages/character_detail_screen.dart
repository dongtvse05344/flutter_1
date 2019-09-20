import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/models/character.dart';
import 'package:myapp/styleguide.dart';

class CharacterDetailScreen extends StatefulWidget {
  final Character character;

  CharacterDetailScreen({Key key, this.character}) : super(key: key);

  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: "111",
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: widget.character.colors,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft)),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 16),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 40,
                    icon: Icon(
                      Icons.close,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: 'kaka',
                    child: Image.asset(
                      widget.character.imagePath,
                      height: screenHeight * 0.45,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Hero(
                        tag: 'name-${widget.character.name}',
                        child: Text(widget.character.name,
                            style: AppTheme.heading))),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 8, 90),
                  child: Text(
                    widget.character.description,
                    style: AppTheme.subHeading,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
