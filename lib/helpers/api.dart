import 'package:changenotifier_provider/model/post.dart';
import 'package:dio/dio.dart';

class Api {
   final dio = Dio();

  Future<List<Post>> getAllPost() async {

    const url = 'https://jsonplaceholder.typicode.com/posts';
    var responseData = await dio.get(url);

    if (responseData.statusCode == 200) {

      var jsonData = responseData.data;
      var listData = jsonData as List;
      List<Post> posts = listData.map((e) => Post.fromJson(e)).toList();
      return posts;

    }
    // throw "Api Not Get Data";
    return [];
  }
}
