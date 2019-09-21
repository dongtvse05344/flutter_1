import 'package:flutter/material.dart';
import 'package:myapp/models/character.dart';
import 'package:myapp/pages/character_detail_screen.dart';
import 'package:myapp/styleguide.dart';

class CharacterWidget extends StatefulWidget {
  final Character character;
  final PageController pageController;
  final int currentPage;
  CharacterWidget(
      {Key key, this.character, this.pageController, this.currentPage})
      : super(key: key);

  _CharacterWidgetState createState() => _CharacterWidgetState();
}

class _CharacterWidgetState extends State<CharacterWidget> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            // PageRouteBuilder(
            //     transitionDuration: const Duration(microseconds: 1000),
            //     pageBuilder: (context, _, __) => CharacterDetailScreen(
            //           character: characters[0],
            //         ))
            MaterialPageRoute(
                builder: (context) => CharacterDetailScreen(
                      character: widget.character,
                    )));
      },
      child: AnimatedBuilder(
        animation: widget.pageController,
        builder: (context, child) {
          double value = 1;
          if (widget.pageController.position.haveDimensions) {
            value = widget.pageController.page - widget.currentPage;
            value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
            if (widget.currentPage == 1) print(value);
          }
          return Stack(children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: CharacterCardBackgroundClipper(),
                child: Hero(
                  tag: "bg-${widget.character.name}",
                  child: Container(
                    height: 0.55 * screenHeight,
                    width: 0.9 * screenWidth,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: widget.character.colors,
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft)),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.5),
              child: Hero(
                tag: 'image-${widget.character.name}',
                child: Image.asset(
                  widget.character.imagePath,
                  height: screenHeight * 0.55 * value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Hero(
                      tag: 'name-${widget.character.name}',
                      child:
                          Text(widget.character.name, style: AppTheme.heading)),
                  Text(
                    'Tap to Read more',
                    style: AppTheme.subHeading,
                  )
                ],
              ),
            )
          ]);
        },
      ),
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
