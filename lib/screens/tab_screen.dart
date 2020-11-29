import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_app/screens/account_screen.dart';
import 'package:mobile_app/screens/location_screen.dart';
import 'package:mobile_app/screens/verify_screen.dart';

class TapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text(
            'Sign Up',
            style: const TextStyle(color: Color(0xffFA5457)),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffF6CB1F), Color(0xffF6AF1F)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: FlatButton(
                child: const Text(
                  'sign In',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
          bottom: TabBar(
            unselectedLabelColor: const Color(0xffC7CCDB),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4,
            labelPadding: const EdgeInsets.only(bottom: 5),
            labelColor: const Color(0xffFA5457),
            labelStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
            tabs: <Widget>[
              Tab(
                text: 'Location',
              ),
              Tab(
                text: 'Account',
              ),
              Tab(
                text: 'Verify',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            LocationScreen(),
            AccountScreen(),
            VerifyScreen(),
          ],
        ),
      ),
    );
  }
}
