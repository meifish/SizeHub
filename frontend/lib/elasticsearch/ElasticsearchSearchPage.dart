import 'package:flutter/material.dart';
import 'package:elastic_client/console_http_transport.dart';
import 'package:elastic_client/elastic_client.dart';
import 'package:size_hub/elasticsearch/ElasticsearchDelegate.dart';

class ElasticSearchPage extends StatefulWidget {
  @override
  _ElasticSearchPageState createState() => _ElasticSearchPageState();
}

class _ElasticSearchPageState extends State<ElasticSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.search), onPressed: _showSearch),
    );
  }

  Future<void> _showSearch() async {
    await showSearch(
        context: context, delegate: ElasticSearchDelegate(), query: "");
  }
}
