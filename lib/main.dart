import 'package:flutter/material.dart';
import 'package:foodapp/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/foodScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: kWhiteColor,
        primaryColor: kPrimaryColor,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(fontWeight: FontWeight.bold),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: Container(
          padding: EdgeInsets.all(5),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: kPrimaryColor.withOpacity(.26)),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
            child: SvgPicture.asset(
              "assets/icons/plus.svg",
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TopNavButtons(
                  image: "menu.svg",
                ),
                pageTitle(context),
                categoryScrollList(),
                SearchFoodBox(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      FoodCard(
                        title: "Vegan salad bowl",
                        price: 20,
                        image: "image_1.png",
                      ),
                      FoodCard(
                        title: "Vegan salad bowl",
                        price: 40,
                        image: "image_2.png",
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String title;
  final String ingredient;
  final String image;
  final int price;
  final String description;
  final String calories;

  const FoodCard({
    Key key,
    this.title,
    this.ingredient,
    this.image,
    this.price,
    this.description,
    this.calories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FoodScreen()));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10),
        height: 250,
        width: 185,
        child: Stack(
          children: <Widget>[
            //Big light background
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 240,
                width: 175,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34),
                    color: kPrimaryColor.withOpacity(.06)),
              ),
            ),

            //Rounded Background
            Positioned(
              left: 5,
              top: 5,
              child: Container(
                height: 120.5,
                width: 120.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor.withOpacity(.15),
                ),
              ),
            ),

            //Food image
            Positioned(
              top: 0,
              left: -30,
              child: Hero(
                tag: image,
                child: Container(
                  height: 120,
                  width: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/" + image)),
                  ),
                ),
              ),
            ),

            //price
            Positioned(
              right: 20,
              top: 50,
              child: Text("\$" + price.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: kPrimaryColor)),
            ),
            Positioned(
              top: 125,
              left: 20,
              child: Container(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "With red tomato",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: kTextColor.withOpacity(.4)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Conrary to popular belief, Lorem ipsum is not simply random text. It has",
                      maxLines: 4,
                      style: Theme.of(context).textTheme.caption.copyWith(
                          color: kTextColor.withOpacity(.7), fontSize: 10),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "420Kcal",
                      style: Theme.of(context).textTheme.caption.copyWith(
                          color: kTextColor.withOpacity(.7),
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchFoodBox extends StatelessWidget {
  const SearchFoodBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: kBorderColor),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 20,
            child: SvgPicture.asset("assets/icons/search.svg"),
          ),
          searchTextField()
        ],
      ),
    );
  }

  Widget searchTextField() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 5, top: 18),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
          ),
        ),
      ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  final String title;
  final bool active;

  const CategoryTitle({
    Key key,
    @required this.title,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.button.copyWith(
            color: active ? kPrimaryColor : kTextColor.withOpacity(.4)),
      ),
    );
  }
}

Widget categoryScrollList() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: <Widget>[
        CategoryTitle(title: "All", active: true),
        CategoryTitle(title: "Italian"),
        CategoryTitle(title: "Asian"),
        CategoryTitle(title: "Chinese"),
        CategoryTitle(title: "Burgers"),
      ],
    ),
  );
}

Widget pageTitle(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Text(
      "Simple way to find \nTasty food",
      style: Theme.of(context).textTheme.headline6,
    ),
  );
}

class TopNavButtons extends StatelessWidget {
  final String image;
  const TopNavButtons({
    this.image,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 5),
      child: Align(
        alignment: Alignment.topRight,
        child: SvgPicture.asset(
          "assets/icons/$image",
          height: 11,
        ),
      ),
    );
  }
}
