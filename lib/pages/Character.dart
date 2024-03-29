import 'package:flutter/material.dart';
import 'package:myapp/models/character.dart';
import 'package:myapp/styleguide.dart';
import 'package:myapp/widgets/character_widget.dart';

class CharacterListingScreen extends StatefulWidget {
  CharacterListingScreen({Key key}) : super(key: key);

  _CharacterListingScreenState createState() => _CharacterListingScreenState();
}

class _CharacterListingScreenState extends State<CharacterListingScreen> {
  PageController _pageController;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.search),
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, top: 8.0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(text: "Despicable Me!", style: AppTheme.display1),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Characters', style: AppTheme.display2)
                  ])),
                ),
                Expanded(
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    children: <Widget>[
                      for(var i = 0; i < characters.length;i++) 
                        CharacterWidget(character: characters[i],pageController: _pageController,currentPage: i)
                      ],
                      
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
        ));
  }
}
