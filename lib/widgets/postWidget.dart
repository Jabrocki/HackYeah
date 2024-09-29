// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hackyeah/widgets/like.dart';
import 'package:provider/provider.dart';

//App State
import '../appState/mainAppState.dart';

//Notion
import '../notion/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    var mainAppState = context.watch<MainAppState>();

    //void likeUpdate() {
    //  mainAppState.mainLikeUpdate(postIndex);
    //}

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.all(16),
        // Stylizacja
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.secondary,
              size: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.userName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${post.activity}: ${post.value} ",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(onPressed: () {}, child: Like(likeNumber: post.likes))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
