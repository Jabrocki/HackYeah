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

    return 
      Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.all(16),
                // Stylizacja
                decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.primary, width: 4.0),
                color: Color.fromRGBO(79, 81, 140, 0.8),),
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.primary,
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
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${post.activity}: ${post.value} ",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(onPressed: () {}, child: Like(likeNumber: post.likes), style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
      ),)
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
