import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
  // PaintingBinding.instance.imageCache.maximumSize = 1024 * 1024 * 1024;
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
      home: const MyHomePage(),
    );
  }
}

class Snacks {
  final String name;
  final String image;
  final double price;
  final String category;
  bool favourite;
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
  List<Snacks> snacksList = [
    Snacks(
        name: 'Apples',
        image: 'assets/images/apples.jpg',
        price: 1.54,
        category: 'Fruits',
        favourite: true),
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
        category: 'Desert',
        favourite: false),
    Snacks(
        name: 'Blueberry Ice Cream,',
        image: 'assets/images/blueberry_icecream.jpg',
        price: 2.56,
        category: 'Desert',
        favourite: false),
    Snacks(
        name: 'Blueberry Toast',
        image: 'assets/images/blueberry_toast.jpg',
        price: 2.56,
        category: 'Desert',
        favourite: false),
    Snacks(
        name: 'Bolognese',
        image: 'assets/images/bolognese.jpg',
        price: 5.40,
        category: 'Dinner',
        favourite: false),
    Snacks(
        name: 'Ceasar Salad',
        image: 'assets/images/ceasar_salad.jpg',
        price: 5.40,
        category: 'Dinner',
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
        price: 5.40,
        category: 'Drinks',
        favourite: false),
    Snacks(
        name: 'Chicken Burger',
        image: 'assets/images/chicken_burger.jpg',
        price: 5.40,
        category: 'Dinner',
        favourite: true),
    Snacks(
        name: 'Chicken Salad',
        image: 'assets/images/chicken_salad.jpg',
        price: 5.40,
        category: 'Dinner',
        favourite: false),
    Snacks(
        name: 'Chocolate Donoughts',
        image: 'assets/images/chocolate_donoughts.jpg',
        price: 1.54,
        category: 'Desert',
        favourite: false),
    Snacks(
        name: 'Chocolate Oreo Ice Cream',
        image: 'assets/images/chocolate_oreo_icecream.jpg',
        price: 2.56,
        category: 'Desert',
        favourite: true),
    Snacks(
        name: 'Crouton Salad',
        image: 'assets/images/crouton_salad.jpg',
        price: 5.40,
        category: 'Dinner',
        favourite: true),
    Snacks(
        name: 'Grilled Cheese Sandwich',
        image: 'assets/images/grilled_cheese.jpg',
        price: 5.40,
        category: 'Dinner',
        favourite: false),
    Snacks(
        name: 'Kale Pasta',
        image: 'assets/images/kale_pasta.jpg',
        price: 5.40,
        category: 'Dinner',
        favourite: false),
    Snacks(
        name: 'New York Pizza',
        image: 'assets/images/pizaa.jpg',
        price: 5.40,
        category: 'Dinner',
        favourite: false),
    Snacks(
        name: 'Pici Beef Pasta',
        image: 'assets/images/pici_beef_pasta.jpg',
        price: 5.40,
        category: 'Dinner',
        favourite: false),
    Snacks(
        name: 'Tomatoe Soup',
        image: 'assets/images/tomatoe_soup.jpg',
        price: 5.40,
        category: 'Dinner',
        favourite: false),
    Snacks(
        name: 'White Wine',
        image: 'assets/images/white_wine.jpg',
        price: 3.60,
        category: 'Drinks',
        favourite: false),
    Snacks(
        name: 'Strawberry Milkshake',
        image: 'assets/images/strawberry_milkshake.jpg',
        price: 3.60,
        category: 'Drinks',
        favourite: true),
    Snacks(
        name: 'Ice Cream',
        image: 'assets/images/ice_cream.jpg',
        price: 3.60,
        category: 'Drinks',
        favourite: false),
    Snacks(
        name: 'Flapjacks',
        image: 'assets/images/flapjacks.jpg',
        price: 2.56,
        category: 'Desert',
        favourite: true),
    Snacks(
        name: 'Fruits and Yogurt',
        image: 'assets/images/yourgut_fruit.jpg',
        price: 2.56,
        category: 'Desert',
        favourite: false),
    Snacks(
        name: 'Oranges',
        image: 'assets/images/orange.jpg',
        price: 1.20,
        category: 'Fruits',
        favourite: false),
    Snacks(
        name: 'Mango',
        image: 'assets/images/mango.jpg',
        price: 1.20,
        category: 'Fruits',
        favourite: false),
    Snacks(
        name: 'Pawpaw',
        image: 'assets/images/pawpaw.jpg',
        price: 1.20,
        category: 'Fruits',
        favourite: false),
  ];
  late AnimationController _favouriteController;
  late AnimationController _tickController;
  late Animation<double> _tickControllerX;
  late StreamController<List> favouriteSnackController;
  late Stream<List> favouriteSnackStream;
  @override
  void initState() {
    super.initState();
    favouriteSnackController = StreamController<List>.broadcast();
    favouriteSnackStream = favouriteSnackController.stream;
    _favouriteController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _tickController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _tickControllerX = Tween<double>(begin: 0, end: 1).animate(_tickController)
      ..addListener(() {
        setState(() {});
      });
    _tickController.forward();
  }

  @override
  void dispose() {
    _favouriteController.dispose();
    _tickController.dispose();
    super.dispose();
  }

  void updateFavourite(int index) {
    snacksList[index].favourite = !snacksList[index].favourite;
  }

  getdetailsPage(documentId) {
    return () {
      int cartNumber = 1;

      StreamController<String> cartStreamController =
          StreamController<String>();
      Stream<String> cartNumberStream = cartStreamController.stream;
      void updateCartNumber(int newCartNumber) {
        cartStreamController.add(newCartNumber.toString());
      }

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(255, 231, 245, 232),
              title: Text(
                'Item Details',
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w500),
              ),
              content: AspectRatio(
                aspectRatio: 15 / 30,
                child: ListView(
                  children: [
                    RichText(
                      text: TextSpan(
                          style: GoogleFonts.montserrat(
                              color: Colors.black, fontSize: 28),
                          text: documentId.name),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage(documentId.image),
                        ),
                        IconButton(
                          iconSize: 25,
                          splashRadius: 50,
                          onPressed: () {
                            updateFavourite(snacksList.indexOf(documentId));
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
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Text(
                      'Price: \$ ${documentId.price}',
                      style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 28),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cartNumber;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (cartNumber != 1) {
                                  cartNumber -= 1;
                                  updateCartNumber(cartNumber);
                                }
                              });
                            },
                            child: const Text(
                              '-  ',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            ),
                          ),
                          StreamBuilder<String>(
                            stream: cartNumberStream,
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              if (snapshot.hasData) {
                                return Text(snapshot.data ?? '1',
                                    style:
                                        GoogleFonts.montserrat(fontSize: 50));
                              } else {
                                return Text(
                                  '1',
                                  style: GoogleFonts.montserrat(fontSize: 50),
                                );
                              }
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                cartNumber += 1;
                                updateCartNumber(cartNumber);
                              });
                            },
                            child: const Text(
                              '  +',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Order Confirmation'),
                                content: Text(
                                    'You are about to order $cartNumber of ${documentId.name}'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Row(
                                                  children: [
                                                    AnimatedBuilder(
                                                        animation:
                                                            _tickControllerX,
                                                        builder: (BuildContext
                                                                context,
                                                            Widget? child) {
                                                          return SizedBox(
                                                            height: 20,
                                                            width: 20,
                                                            child: Lottie.asset(
                                                                Icons8
                                                                    .check_circle),
                                                          );
                                                        }),
                                                    const Text(
                                                        '   Your order has been confirmed!'),
                                                  ],
                                                ),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text('done'))
                                                ],
                                              );
                                            });
                                      },
                                      child: const Text('Order'))
                                ],
                              );
                            });
                      },
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: 120 / 30,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(5)),
                            height: 40,
                            width: 150,
                            child: Center(
                              child: Text(
                                'Add to cart',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white, fontSize: 28),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    };
  }

  List<Snacks> favouriteSnacks() {
    return snacksList.where((snack) => snack.favourite == true).toList();
  }

  getFavourites() {
    final List list = favouriteSnacks();
    favouriteSnackController.add(list);

    return StreamBuilder<List>(
        stream: favouriteSnackStream,
        builder: (context, snapshot) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: 60,
              child: Wrap(
                spacing: 10.0,
                runSpacing: 4.0,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: List.generate(
                  list.length,
                  (index) {
                    return Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(110, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: GestureDetector(
                        onTap: getdetailsPage(list[index]),
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundImage: AssetImage(list[index].image)),
                          title: Text(list[index].name),
                          subtitle: Text('\$ ${list[index].price}'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        });
  }

  List<Snacks> filteredSnacks(String category) {
    return snacksList.where((snack) => snack.category == category).toList();
  }

  getFruits() {
    final List list = filteredSnacks('Fruits');

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 60,
        child: Wrap(
          spacing: 10.0,
          runSpacing: 4.0,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: List.generate(
            list.length,
            (index) {
              return Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(110, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: MediaQuery.of(context).size.width / 2.2,
                child: GestureDetector(
                  onTap: getdetailsPage(list[index]),
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(list[index].image)),
                    title: Text(list[index].name),
                    subtitle: Text('\$ ${list[index].price}'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  getDrinks() {
    final List list = filteredSnacks('Drinks');

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 60,
        child: Wrap(
          spacing: 10.0,
          runSpacing: 4.0,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: List.generate(
            list.length,
            (index) {
              return Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(110, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: MediaQuery.of(context).size.width / 2.2,
                child: GestureDetector(
                  onTap: getdetailsPage(list[index]),
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(list[index].image)),
                    title: Text(list[index].name),
                    subtitle: Text('\$ ${list[index].price}'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  getDesert() {
    final List list = filteredSnacks('Desert');

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 60,
        child: Wrap(
          spacing: 10.0,
          runSpacing: 4.0,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: List.generate(
            list.length,
            (index) {
              return Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(110, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: MediaQuery.of(context).size.width / 2.2,
                child: GestureDetector(
                  onTap: getdetailsPage(list[index]),
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(list[index].image)),
                    title: Text(list[index].name),
                    subtitle: Text('\$ ${list[index].price}'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  getDinner() {
    final List list = filteredSnacks('Dinner');

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 60,
        child: Wrap(
          spacing: 10.0,
          runSpacing: 4.0,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: List.generate(
            list.length,
            (index) {
              return Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(110, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: MediaQuery.of(context).size.width / 2.2,
                child: GestureDetector(
                  onTap: getdetailsPage(list[index]),
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(list[index].image)),
                    title: Text(list[index].name),
                    subtitle: Text('\$ ${list[index].price}'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  getFeaturedList() {
    final random = Random();
    final Set<int> generatedSet = {};
    final List<int> featuredlist = [];

    while (featuredlist.length < 10) {
      final randomInt = random.nextInt(16) + 1;
      if (!generatedSet.contains(randomInt)) {
        generatedSet.add(randomInt);
        featuredlist.add(randomInt);
      }
    }
    return featuredlist;
  }

  getFeatured() {
    final List<int> featuredlist = getFeaturedList();

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: featuredlist.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            // onTap: getDetails(snacksList[index]),
            onTap: getdetailsPage(snacksList[featuredlist[index]]),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Card(
                // color: Colors.amber,
                child: SizedBox(
                  height: 250,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage(snacksList[featuredlist[index]].image),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: snacksList[featuredlist[index]].name,
                            style: GoogleFonts.montserrat(
                                fontSize: 10, color: Colors.black),
                          ),
                        ),
                      ),
                      Text('\$ ${snacksList[featuredlist[index]].price}')
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 245, 232),
        appBar: AppBar(
          leading: const Icon(
            Icons.storefront,
          ),
          title: Text(
            'F O O D   P L U S +',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
          ),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 189, 252, 193),
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
              getFeatured(),
              SizedBox(
                height: 50,
                child: TabBar(
                  isScrollable: true,
                  labelStyle: GoogleFonts.montserrat(fontSize: 20),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: GoogleFonts.montserrat(fontSize: 15),
                  tabs: const [
                    Tab(
                      text: 'Favourites',
                    ),
                    Tab(
                      text: 'Dinner',
                    ),
                    Tab(
                      text: 'Deserts',
                    ),
                    Tab(
                      text: 'Drinks',
                    ),
                    Tab(
                      text: 'Fruits',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    getFavourites(),
                    getDinner(),
                    getDesert(),
                    getDrinks(),
                    getFruits(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
