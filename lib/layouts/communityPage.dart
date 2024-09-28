import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/post.dart';
//App State
import '../appState/mainAppState.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    var mainAppState = context.watch<MainAppState>();

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: mainAppState.posts.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Post(
            post: mainAppState.posts[index],
            postIndex: index,
            ),
        );
      }
    );
  }
}

