import 'package:flutter/material.dart';
import 'package:foodapp/constants.dart';
import 'main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              topNavButtons(context),
              FoodImage(
                image: "image_1.png",
              ),
              SizedBox(
                height: 20,
              ),
              foodTitle(context),
              SizedBox(
                height: 20,
              ),
              foodDescription(context),
              Spacer(),
              bottomCart(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomCart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(.2),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Add to bag",
                  style: Theme.of(context).textTheme.button,
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                    height: 10,
                    child: SvgPicture.asset("assets/icons/forward.svg")),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.all(5),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor.withOpacity(.26)),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor,
                ),
                child: SvgPicture.asset(
                  "assets/icons/bag.svg",
                ),
              ))
        ],
      ),
    );
  }

  Text foodDescription(BuildContext context) {
    return Text(
      "Conrary to popular belief, Lorem ipsum is not simply random text. It has roots in a piece of clasical Latin literature from 45 BC",
      maxLines: 4,
      style: Theme.of(context)
          .textTheme
          .caption
          .copyWith(color: kTextColor.withOpacity(.7), fontSize: 10),
    );
  }

  Widget foodTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Vegan salad bowl\n",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextSpan(
                text: "With red tomato",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: kTextColor.withOpacity(.4)),
              )
            ],
          ),
        ),
        Text(
          "\$20",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: kPrimaryColor),
        ),
      ],
    );
  }

  Widget topNavButtons(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: TopNavButtons(
            image: "backward.svg",
          ),
        ),
        TopNavButtons(
          image: "menu.svg",
        )
      ],
    );
  }
}

class FoodImage extends StatelessWidget {
  final String image;
  const FoodImage({
    Key key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        padding: EdgeInsets.all(4),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kSecondaryColor,
        ),
        child: Hero(
          tag: image,
          child: Image.asset(
            "assets/images/$image",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
