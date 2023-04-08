import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/useanimations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({
    super.key,
  });

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with TickerProviderStateMixin {
  late AnimationController _favouriteController;
  int cartNumber = 1;

  @override
  void initState() {
    super.initState();
    _favouriteController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _favouriteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 15, 0, 0),
                child: Text(
                  'Food Name',
                  style: GoogleFonts.montserrat(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              // color: Colors.amber,
              height: 300,
              width: double.infinity,
              child: Stack(children: [
                Positioned(
                  top: 40,
                  left: 30,
                  child: CircleAvatar(
                    // backgroundImage: AssetImage('),
                    radius: 100,
                  ),
                ),
                Positioned(
                    top: 170,
                    left: 280,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          color: Colors.white24),
                      child: IconButton(
                        iconSize: 25,
                        splashRadius: 50,
                        onPressed: () {
                          if (_favouriteController.status ==
                              AnimationStatus.dismissed) {
                            _favouriteController.reset();
                            _favouriteController.animateTo(0.5);
                          } else {
                            _favouriteController.reverse();
                          }
                        },
                        icon: Lottie.asset(Icons8.heart_color,
                            controller: _favouriteController),
                      ),
                    ))
              ]),
            ),
            Container(
              width: double.infinity,
              // color: Colors.amberAccent,
              height: 80,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Positioned(
                      left: 8,
                      child: Text(
                        '\$ 14.46',
                        style: GoogleFonts.montserrat(fontSize: 35),
                      )),
                  Positioned(
                    child: Container(
                      height: double.maxFinite,
                      width: 250,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (cartNumber != 1) {
                                          cartNumber -= 1;
                                        }
                                      });
                                    },
                                    child: const Text(
                                      '-  ',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.redAccent),
                                    ),
                                  ),
                                  Text(
                                    cartNumber.toString(),
                                    style: GoogleFonts.montserrat(fontSize: 30),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        cartNumber += 1;
                                      });
                                    },
                                    child: const Text(
                                      '  +',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.redAccent),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            'Add to cart',
                            style: GoogleFonts.montserrat(
                                fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              child: Text(
                'Featured',
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
