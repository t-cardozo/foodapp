import 'package:flutter/material.dart';
import 'package:foodapp/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              mainMenuButton(),
              pageTitle(context),
              categoryScrollList(),
              SearchFoodBox()
            ],
          ),
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
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: kBorderColor),
      ),
      child: SvgPicture.asset("assets/icons/search.svg"),
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

Widget mainMenuButton() {
  return Padding(
    padding: const EdgeInsets.only(right: 10, top: 5),
    child: Align(
      alignment: Alignment.topRight,
      child: SvgPicture.asset(
        "assets/icons/menu.svg",
        height: 11,
      ),
    ),
  );
}