
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:size_hub/api/args/CreateCommentArgs.dart';
import 'package:size_hub/data/CommentData.dart';
import 'package:size_hub/data/DetailedPostData.dart';
import 'package:size_hub/data/PostPreviewData.dart';
import 'package:size_hub/data/PublicUserProfileData.dart';

import 'ApiErrorResponse.dart';

enum PostSort {
  RECENT,
  LIKES,
  COMMENTS,
}

class ApiClient{

  static BaseOptions options = BaseOptions(
      responseType: ResponseType.plain,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      validateStatus: (code) {
        return true;
      });
  static Dio dio = Dio(options);

  Map<String, dynamic> _validateResponse(Response response){
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

  Future<Map<String, dynamic>> _makeGetRequest(String path, Map<String, dynamic> args) async {
    try {
      return _validateResponse(await dio.get("http://10.0.2.2:3000" + path, queryParameters: args));
    }
    catch(e){ print(e); return null; }
  }

  Future<Map<String, dynamic>> _makePostRequest(String path, dynamic data) async {
    try {
      return _validateResponse(await dio.post("http://10.0.2.2:3000" + path, data: data));
    }
    catch(e){ print(e); return null; }
  }

  //API CALLS
  
  Future<CommentData> createComment(CreateCommentArgs args) async{
    Map<String, dynamic> response = await _makePostRequest("/createComment", args);
    if(response == null) return null;
    return CommentData.fromJson(response);
  }

  Future<List<CommentData>> getReplies(String postId) async{
    Map<String, dynamic> response = await _makeGetRequest("/replies", {"postId": postId});
    if(response == null) return null;
    return (response["comments"] as List<dynamic>).map((e){ return CommentData.fromJson(e); }).toList();
  }

  Future<DetailedPostData> getDetailedPost(String postId) async{
    Map<String, dynamic> response = await _makeGetRequest("/post", {"postId": postId});
    if(response == null) return null;
    return DetailedPostData.fromJson(response);
  }

  Future<PublicUserProfileData> getProfile(String userId) async{
    Map<String, dynamic> response = await _makeGetRequest("/profile", {"userId": userId});
    if(response == null) return null;
    return PublicUserProfileData.fromJson(response);
  }

  Future<List<PostPreviewData>> getPostsByUser(String userId, PostSort sort) async{
    Map<String, dynamic> response = await _makeGetRequest("/postsByUser", {"userId": userId, "sort": sort.toString().split(".").last});
    if(response == null) return null;
    return (response["posts"] as List<dynamic>).map((e){ return PostPreviewData.fromJson(e); }).toList();
  }
}