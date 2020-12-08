import 'package:flutter/material.dart';
import 'package:elastic_client/console_http_transport.dart';
import 'package:elastic_client/elastic_client.dart' as elastic;

class ElasticSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () async {
            query = '';
            await searchElasticServer(query);
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          this.close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: searchElasticServer(query),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return showItem(snapshot.data);
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: searchElasticServer(query),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return showItem(snapshot.data);
          }
        });
  }

  Widget showItem(List<String> itemList) {
    return ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int idx) {
          return ListTile(title: Text(itemList[idx]));
        });
  }

  Future searchElasticServer(searchQuery) async {
    final transport = ConsoleHttpTransport(
        Uri.parse(
            'https://a00fb47e0c284c62be6ba4d0526aae81.us-central1.gcp.cloud.es.io:9243'),
        basicAuth: BasicAuth("elastic", "SppDWAjzBCOhkZbGf1edXOYg"));
    final client = elastic.Client(transport);
    List<String> itemList = List<String>();

    final SearchResult = await client.search(
        'elastic-clothingitems-new',
        '_doc',
        // query the field 'name' in the collection of 'elastic-clothingitems-new'
        elastic.Query.term('name', ['$searchQuery']),
        source: true);

    for (final iter in SearchResult.hits) {
      Map<dynamic, dynamic> doc = iter.doc;
      itemList.add(doc['name'].toString());
    }

    await transport.close();

    if (SearchResult.totalCount <= 0) {
      return null;
    } else {
      return itemList;
    }
  }
}
