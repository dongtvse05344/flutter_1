import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data/property.dart';

class DetailPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;

  DetailPage({Key key, this.heroTag, this.foodName, this.foodPrice})
      : super(key: key);

  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Details',
          style: TextStyle(
              fontFamily: 'OpenSans', fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 80,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      ),
                      color: Colors.white),
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 170,
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            widget.foodName,
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 21,
                            height: 60,
                            child: Center(
                              child: Text(
                                widget.foodPrice,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 40,
                              width: 1,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width / 2 - 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF7A9BEE),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20))),
                                  width: 40,
                                  height: 40,
                                  child: IconButton(
                                    icon: Icon(Icons.remove),
                                    color: Colors.white,
                                    onPressed: () {},
                                  ),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF7A9BEE),
                                    ),
                                    width: 40,
                                    height: 40,
                                    child: Center(
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    )),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF7A9BEE),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  width: 40,
                                  height: 40,
                                  child: IconButton(
                                    icon: Icon(Icons.add),
                                    color: Colors.white,
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20),
                        child: Container(
                          height: 130,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              for (var i = 0; i < properties.length; i++)
                                propertyDetail(properties[i], i == 0)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: (MediaQuery.of(context).size.width / 2) - 100,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.heroTag),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    color: Color(0xFF160b24),
                  ),
                  child: Center(
                    child: Text(
                      '\$52.00',
                      style: TextStyle(color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'OpenSans'
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget propertyDetail(Property property, bool highlight) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        height: 130,
        width: 80,
        decoration: BoxDecoration(
            color: highlight ? Color(0xFF7A9BEE) : Colors.white,
            border: Border.all(
              color: !highlight ? Colors.grey : Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(property.name,
                    style: TextStyle(
                      fontSize: 12,
                      color: !highlight ? Colors.grey : Colors.white,
                    )),
                flex: 3,
              ),
              Expanded(
                  child: Text(
                property.value,
                style: TextStyle(
                    fontSize: 20,
                    color: !highlight ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold),
              )),
              Expanded(
                  child: Text(
                property.unit,
                style: TextStyle(
                  color: !highlight ? Colors.grey : Colors.white24,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
