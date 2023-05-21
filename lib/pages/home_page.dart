import 'package:changenotifier_provider/helpers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PostProvider>(context, listen: false).getAllPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('ChangeNotifier Provider'),),
      body: Consumer<PostProvider>(
        builder: (context, snapshot, child){
          final posts = snapshot.posts;
          return posts.isNotEmpty ?
          ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index){
              final post = posts[index];
              return Card(
                child: ListTile(
                  leading: Text('${post.id}'),
                  title: Text(post.title),
                  subtitle: Text(post.body),
                  trailing: Text('${post.userId}'),
                ),
              );
            }
            ) : const Center(child: CircularProgressIndicator(),);
        }
        ),
    );
  }
}