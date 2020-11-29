import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_app/providers/meals.dart';
import 'package:mobile_app/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class MealOverviewScreen extends StatefulWidget {
  @override
  _MealOverviewScreenState createState() => _MealOverviewScreenState();
}

class _MealOverviewScreenState extends State<MealOverviewScreen> {
  var _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Meals>(context).fetchMEalData();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  var color1 = 0xffF14C5D;
  var color2 = 0xffD43370;
  var color3 = 0xffF6F8F9;
  var color4 = 0xffF6F8F9;
  var textColor1 = 0xffFFFFFF;
  var textColor2 = 0xff70798C;
  @override
  Widget build(BuildContext context) {
    List lightList = Provider.of<Meals>(context).lightMealList;
    List bestValueList = Provider.of<Meals>(context).bestValueList;
    List plusList = Provider.of<Meals>(context).plusList;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('./images/icn_delivery.png'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Delivery to ',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                    ),
                    Text(
                      'STC',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    InkWell(child: const Icon(Icons.keyboard_arrow_down))
                  ],
                ),
                Container(
                    margin:
                        const EdgeInsets.only(right: 200, top: 20, bottom: 20),
                    child: Image.asset('./images/Meal_on_the_go.png')),
                Image.asset('./images/banner.png'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShaderMask(
                            blendMode: BlendMode.srcATop,
                            child: Text(
                              'Order By 11:30 AM',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [Color(0xffF34E5C), Color(0xffD23072)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds),
                          ),
                          Text(
                            'select your meal',
                            style: TextStyle(
                                color: Color(0xff70798C),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 4, bottom: 4, right: 7, left: 7),
                        child: Text(
                          'All',
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            gradient: LinearGradient(
                                colors: [Color(color1), Color(color2)])),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 4, bottom: 4, right: 7, left: 7),
                        child: Text(
                          'Syami',
                          style: TextStyle(color: Color(textColor2)),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            gradient: LinearGradient(
                                colors: [Color(color3), Color(color4)])),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 4, bottom: 4, right: 7, left: 7),
                        child: Text(
                          'Healthy',
                          style: TextStyle(color: Color(textColor2)),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            gradient: LinearGradient(
                                colors: [Color(color3), Color(color4)])),
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(right: 250, bottom: 15),
                    child: Image.asset('./images/title_light.png')),
                Container(
                  width: double.infinity,
                  height: 300,
                  child: ListView.builder(
                      itemCount: lightList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => MealItem(
                            img: lightList[index].urlImage,
                            regularPrice: lightList[index].regularPrice,
                            plusePrice: lightList[index].plusPrice,
                            name: lightList[index].name,
                            restaurant: lightList[index].restaurant,
                          )),
                ),
                Container(
                    margin: const EdgeInsets.only(right: 250, bottom: 15),
                    child: Image.asset('./images/title_best_value.png')),
                Container(
                  width: double.infinity,
                  height: 300,
                  child: ListView.builder(
                      itemCount: bestValueList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => MealItem(
                            img: bestValueList[index].urlImage,
                            regularPrice: bestValueList[index].regularPrice,
                            plusePrice: bestValueList[index].plusPrice,
                            name: bestValueList[index].name,
                            restaurant: bestValueList[index].restaurant,
                          )),
                ),
                Container(
                    margin: const EdgeInsets.only(right: 250, bottom: 15),
                    child: Image.asset('./images/title_plus.png')),
                Container(
                  width: double.infinity,
                  height: 300,
                  child: ListView.builder(
                      itemCount: plusList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => MealItem(
                            img: plusList[index].urlImage,
                            regularPrice: plusList[index].regularPrice,
                            plusePrice: plusList[index].plusPrice,
                            name: plusList[index].name,
                            restaurant: plusList[index].restaurant,
                          )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
