import 'package:flutter/cupertino.dart';

class MealItem extends StatelessWidget {
  final String img;
  final int regularPrice;
  final int plusePrice;
  final String name;
  final String restaurant;

  const MealItem(
      {this.img,
      this.regularPrice,
      this.plusePrice,
      this.name,
      this.restaurant});
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              img,
              fit: BoxFit.fill,
              height: 180,
              width: 130,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'EGP${regularPrice.toString()}',
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(0xff70798C)),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Image.asset('./images/icn_plus.png'),
              Text(
                'EGP${plusePrice.toString()}',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            overflow: TextOverflow.clip,
            style: TextStyle(fontSize: 13),
          ),
          Container(
            margin: const EdgeInsets.only(top: 3, right: 35),
            child: Text(
              restaurant,
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 10, color: const Color(0xff70798C)),
            ),
          ),
        ],
      ),
    );
  }
}
