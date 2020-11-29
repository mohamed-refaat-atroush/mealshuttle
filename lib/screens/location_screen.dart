import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/providers/searches.dart';
import 'package:mobile_app/widgets/location_input.dart';
import 'package:mobile_app/widgets/text_field_search.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool _inInit = true;
  @override
  void didChangeDependencies() {
    if (_inInit) {
      Provider.of<Searches>(context, listen: false).fetchSearch();
    }
    _inInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 15,
              ),
              const Icon(
                Icons.location_city,
                color: Color(0xff01B4BC),
              ),
              const Text(
                'Set your work location',
                style: const TextStyle(
                  color: const Color(0xff70798C),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 15, bottom: 15),
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffFA5457)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TExtFeildSearch()),
          LocationInput()
        ],
      ),
    );
  }
}
