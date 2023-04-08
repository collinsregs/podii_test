import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podii_test/test.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
  PaintingBinding.instance.imageCache.maximumSize = 512 * 1024 * 1024;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'S N A C K S ! ! !',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(),
    );
  }
}

class Snacks {
  final String name;
  final String image;
  final double price;
  final String category;
  final bool favourite;
  Snacks(
      {required this.name,
      required this.image,
      required this.price,
      required this.category,
      required this.favourite});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final List<Snacks> snacksList = [
    Snacks(
        name: 'Apples',
        image: 'assets/images/apples.jpg',
        price: 1.54,
        category: 'Fruits',
        favourite: false),
    Snacks(
        name: 'Bananas',
        image: 'assets/images/banana.jpg',
        price: 1.20,
        category: 'Fruits',
        favourite: false),
    Snacks(
        name: 'Raspberry Cake',
        image: 'assets/images/berry_cake.jpg',
        price: 2.58,
        category: 'Cakes',
        favourite: false),
    Snacks(
        name: 'Blueberry Ice Cream,',
        image: 'assets/images/blueberry_icecream.jpg',
        price: 1.54,
        category: 'Ice Cream',
        favourite: false),
    Snacks(
        name: 'Blueberry Toast',
        image: 'assets/images/blueberry_toast.jpg',
        price: 1.54,
        category: 'Desert',
        favourite: false),
    Snacks(
        name: 'Bolognese',
        image: 'assets/images/bolognese.jpg',
        price: 1.54,
        category: 'Dinner',
        favourite: false),
    Snacks(
        name: 'Ceasar Salad',
        image: 'assets/images/ceasar_salad.jpg',
        price: 1.54,
        category: 'Salad',
        favourite: false),
    Snacks(
        name: 'Cherry',
        image: 'assets/images/cherry.jpg',
        price: 1.54,
        category: 'Fruits',
        favourite: false),
    Snacks(
        name: 'Cherry Cocktail',
        image: 'assets/images/cherry_cocktail.jpg',
        price: 1.54,
        category: 'Drinks',
        favourite: false),
    Snacks(
        name: 'Chicken Burger',
        image: 'assets/images/chicken_burger.jpg',
        price: 1.54,
        category: 'Fast Food',
        favourite: false),
    Snacks(
        name: 'Chicken Salad',
        image: 'assets/images/chicken_salad.jpg',
        price: 1.54,
        category: 'Salad',
        favourite: false),
    Snacks(
        name: 'Chocolate Donoughts',
        image: 'assets/images/chocolate_donoughts.jpg',
        price: 1.54,
        category: 'fruits',
        favourite: false),
  ];
  late AnimationController _favouriteController;

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

  getFeatured() {
    final random = Random();
    final Set<int> generatedSet = {};
    final List<int> featuredlist = [];

    while (featuredlist.length < 5) {
      final randomInt = random.nextInt(11) + 1;
      if (!generatedSet.contains(randomInt)) {
        generatedSet.add(randomInt);
        featuredlist.add(randomInt);
      }
    }
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 60,
        child: Wrap(
          spacing: 10.0,
          runSpacing: 4.0,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: List.generate(
            featuredlist.length,
            (index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width / 2.2,
                child: GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(snacksList[featuredlist[index]].image),
                      // backgroundImage: FileImage(snacksList[featuredlist[index]].image),
                    ),
                    title: Text(snacksList[featuredlist[index]].name),
                    subtitle:
                        Text('\$ ${snacksList[featuredlist[index]].price}'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getDetails(documentId) {
      int cartNumber = 1;
      Key _textKey = UniqueKey();
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 0, 0),
                  child: Text(
                    documentId.name,
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
                      backgroundImage: AssetImage(documentId.image),
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
                          '\$ ${documentId.price}',
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
                                      key: _textKey,
                                      style:
                                          GoogleFonts.montserrat(fontSize: 30),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          cartNumber += 1;
                                          print(cartNumber);
                                          _textKey = UniqueKey();
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
              Expanded(child: getFeatured())
            ],
          ),
        ),
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.lightGreenAccent[200],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
                child: RichText(
                  text: TextSpan(
                    text: 'Savour The Moment With Our Delicious Eats',
                    style: GoogleFonts.montserrat(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                child: RichText(
                  text: TextSpan(
                    text: ' Recomended',
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snacksList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      // onTap: getDetails(snacksList[index]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => getDetails(
                              snacksList[index],
                            ),
                          ),
                        );
                        setState(() {});
                      },
                      child: Card(
                        // color: Colors.amber,
                        child: Container(
                          height: 250,
                          width: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage(snacksList[index].image),

                                // child: ClipOval(
                                //   child: Image.asset(
                                //     snacksList[index].image,
                                //     width: 60,
                                //     height: 60,
                                //     fit: BoxFit.cover,
                                //   ),
                                // ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: snacksList[index].name,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                ),
                              ),
                              Text('\$ ${snacksList[index].price}')
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 50,
                child: TabBar(
                  isScrollable: true,
                  labelStyle: GoogleFonts.montserrat(fontSize: 20),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: GoogleFonts.montserrat(fontSize: 15),
                  tabs: [
                    Tab(
                      text: 'Featured',
                    ),
                    Tab(
                      text: 'Dinner',
                    ),
                    Tab(
                      text: 'Drinks',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                    children: [
                      getFeatured(),
                      Center(
                        child: Text('tab2'),
                      ),
                      Center(
                        child: Text('tab3'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
