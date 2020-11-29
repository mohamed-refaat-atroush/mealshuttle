import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/providers/searches.dart';

class TExtFeildSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _suggestionController = TextEditingController();

    return AutoCompleteTextField(
      controller: _suggestionController,
      suggestionsAmount: 6,
      clearOnSubmit: false,
      suggestions: Provider.of<Searches>(context, listen: true).searchesList,
      itemFilter: (item, query) {
        return item.title.toLowerCase().startsWith(query.toLowerCase());
      },
      itemSorter: (a, b) {
        return a.title.compareTo(b.title);
      },
      itemSubmitted: (item) {
        _suggestionController.text = item.title;
      },
      itemBuilder: (context, item) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 20,
                    color: Color(0xffC7CCDB),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    item.title,
                    style: TextStyle(color: Color(0xff01B4BC), fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 250,
                    child: Text(
                      item.subtitle,
                      style: TextStyle(
                        color: Color(0xffC7CCDB),
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
                child: Divider(),
                width: double.infinity,
              )
            ],
          ),
        );
      },
      decoration: const InputDecoration(
        border: InputBorder.none,
        labelText: 'Work Address',
        labelStyle: TextStyle(color: Colors.black),
        suffixIcon: const Icon(
          Icons.search,
          color: const Color(0xffFA5457),
        ),
      ),
    );
  }
}
