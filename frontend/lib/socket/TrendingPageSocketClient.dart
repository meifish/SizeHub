import 'dart:convert';

import 'package:size_hub/data/PostPreviewData.dart';
import 'package:web_socket_channel/io.dart';

class TrendingPageSocketClient{

  final channel = IOWebSocketChannel.connect('ws://10.0.2.2:3000/trending');

  void Function(PostPreviewData) onPost;

  TrendingPageSocketClient(){
    channel.stream.listen((event) {
      if(onPost != null){
        onPost(PostPreviewData.fromJson(jsonDecode(event)));
      }
    });
  }
}