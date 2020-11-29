import 'package:flutter/material.dart';
import 'package:mobile_app/providers/meals.dart';
import 'package:mobile_app/providers/searches.dart';
import 'package:mobile_app/screens/tab_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Searches()),
        ChangeNotifierProvider.value(value: Meals()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            accentColor: const Color(0xffFA5457), cursorColor: Colors.black),
        title: 'Mobile app',
        home: TapScreen(),
      ),
    );
  }
}
