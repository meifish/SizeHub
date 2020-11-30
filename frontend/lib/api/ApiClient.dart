
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:size_hub/api/args/CreateCommentArgs.dart';
import 'package:size_hub/data/CommentData.dart';

import 'ApiErrorResponse.dart';

class ApiClient{

  static BaseOptions options = BaseOptions(
      responseType: ResponseType.plain,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      validateStatus: (code) {
        return true;
      });
  static Dio dio = Dio(options);

  Map<String, dynamic> validateResponse(Response response){
    Map<String, dynamic> res = jsonDecode(response.data);
    if(response.statusCode == 500){
      print("SERVER ERROR");
      print(response.data);
      return null;
    }
    if(res.containsKey("error")){
      print("API ERROR");
      print(ApiErrorResponse.fromJson(res).toString());
      return null;
    }
    return res;
  }

  Future<Map<String, dynamic>> makeGetRequest(String path, Map<String, dynamic> args) async {
    try {
      return validateResponse(await dio.get("http://10.0.2.2:3000" + path, queryParameters: args));
    }
    catch(e){ print(e); return null; }
  }

  Future<Map<String, dynamic>> makePostRequest(String path, dynamic data) async {
    try {
      return validateResponse(await dio.post("http://10.0.2.2:3000" + path, data: data));
    }
    catch(e){ print(e); return null; }
  }

  //API CALLS
  
  Future<CommentData> createComment(CreateCommentArgs args) async{
    Map<String, dynamic> response = await makePostRequest("/createComment", args);
    if(response == null) return null;
    return CommentData.fromJson(response);
  }

  Future<List<CommentData>> getReplies(String postId) async{
    Map<String, dynamic> response = await makeGetRequest("/replies", {"postId": postId});
    if(response == null) return null;
    return (response["comments"] as List<dynamic>).map((e){ return CommentData.fromJson(e); }).toList();
  }
}