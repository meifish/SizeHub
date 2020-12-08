import 'package:flutter/material.dart';
import 'package:elastic_client/console_http_transport.dart';
import 'package:elastic_client/elastic_client.dart';
import 'package:size_hub/elasticsearch/ElasticsearchDelegate.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showSearch() async {
      await showSearch(
          context: context, delegate: ElasticSearchDelegate(), query: "");
    }

    return Stack(
      children: [
        Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Search",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 110,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: TextField(
                    cursorColor: Colors.purple,
                    decoration: InputDecoration(
                        hintText: "Search Product",
                        hintStyle:
                            TextStyle(color: Colors.black38, fontSize: 16),
                        prefixIcon: Material(
                          elevation: 0.0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: IconButton(
                              onPressed: _showSearch,
                              icon: Icon(Icons.search, color: Colors.purple)),
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
