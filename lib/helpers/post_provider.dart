import 'package:changenotifier_provider/helpers/api.dart';
import 'package:flutter/material.dart';
import '../model/post.dart';

class PostProvider extends ChangeNotifier{
  final _api = Api();
  bool isLoading = false;
  List<Post> _posts = [];
  List<Post> get posts => _posts;

  Future<void> getAllPosts() async{
    isLoading = true;
    notifyListeners();

    final response = await _api.getAllPost();
    _posts = response;
    isLoading = false;
    notifyListeners();
  }
}