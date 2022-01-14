import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mycampus/Constants.dart';
import 'package:mycampus/Screens/LoginScreen.dart';
//import 'package:mycampus/Screens/LoginScreen.dart';
import 'package:mycampus/Widgets/Item.dart';

class Slidermain extends StatefulWidget {
  BuildContext context;
  Slidermain({Key key, this.context}) : super(key: key);

  @override
  _SlidermainState createState() => _SlidermainState();
}

class _SlidermainState extends State<Slidermain> {
  int _currentIndex = 0;
  List<Item> items = [
    Item(
      "assets/images/customer-journey.png",
      "une fois connecté vous avez la possibilité de poster  et vendre vos article .",
      "BOUTUTIQUE EN LIGNE",
    ),
    Item(
      "assets/images/way.png",
      "une fois connecté vous avez la possibilité de poster  et vendre vos article .",
      "LIVRAISON A DOMICILE",
    ),
    Item(
      "assets/images/logoApp.png",
      "une fois connecté vous avez la possibilité de poster  et vendre vos article .",
      "METHODE DE PAYEMENT",
    )
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  CarouselController bouteon = CarouselController();
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: whiteColor,
        body: Container(
          height: heigth,
          width: widht,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: heigth * 0.1),
                  child: Container(
                    height: heigth * 0.5,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: heigth * 0.5,
                        // autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        pauseAutoPlayOnTouch: true,
                        autoPlay: true,
                        aspectRatio: 0,
                        disableCenter: true,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      carouselController: this.bouteon,
                      items: items.map((card) {
                        return Builder(builder: (BuildContext context) {
                          return Container(
                            child: card,
                          );
                        });
                      }).toList(),
                    ),
                  )),
              Positioned(
                top: heigth * 0.7,
                width: widht,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(items, (index, url) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? kPrimaryColors
                            : Color.fromRGBO(250, 250, 250, 1),
                      ),
                    );
                  }),
                ),
              ),
              Positioned(
                top: heigth * 0.87,
                left: widht * 0.4,
                right: widht * 0.03,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Container(
                          height: heigth * 0.08,
                          width: widht * 0.3,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: kPrimaryColors,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text("Next",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Roboto-Medium",
                                  color: whiteColor))),
                      onTap: () {
                        if (_currentIndex == 2) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                      // context: widget.context,
                                      )));
                        }
                        this.bouteon.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.fastOutSlowIn,
                            );
                      },
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                    // context: widget.context,
                                    )));
                      },
                      child: Text("Skip",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Roboto-Medium",
                              color: kPrimaryColors)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
