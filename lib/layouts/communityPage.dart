// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:hackyeah/notion/failure_model.dart';
import 'package:provider/provider.dart';
import '../widgets/postWidget.dart';
//App State
import '../appState/mainAppState.dart';

//notion
import '../notion/notion_repository.dart';
import '../notion/post.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({
    super.key,
  });

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  late Future<List<Post>> _futurePosts;

  @override
  void initState() {
    super.initState();
    _futurePosts = PostRepository().getItems();
  }

  Widget build(BuildContext context) {
    var mainAppState = context.watch<MainAppState>();

    return Scaffold(
      appBar: AppBar(
          title: Padding(
  
            padding: const EdgeInsets.all(0),
            child: Text("CarloSocial.", style: TextStyle(
            fontFamily: 'Now',
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
            color: Theme.of(context).colorScheme.primary,
                    )),
          ),
        ),
        body:
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/logo_social.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.2),
                BlendMode.dstATop,
                ))),
          child:
         FutureBuilder(
            future: _futurePosts,
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                final posts = snapshots.data!;
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PostWidget(
                          post: posts[index],
                        ),
                      );
                    });
              } else if (snapshots.hasError) {
                final failure = snapshots.error as Failure;
                return Center(child: Text(failure.message));
              }
              return const Center(child: CircularProgressIndicator());
    })));
  }
}
