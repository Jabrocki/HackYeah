import 'package:flutter/material.dart';
import 'package:hackyeah/widgets/like.dart';
import 'package:provider/provider.dart';

//App State
import '../appState/mainAppState.dart';

class Post extends StatelessWidget {
  final post;
  final postIndex;

  const Post({super.key, required this.post, required this.postIndex});

  @override
  Widget build(BuildContext context) {
    var mainAppState = context.watch<MainAppState>();

    void likeUpdate() {
      mainAppState.mainLikeUpdate(postIndex);
    }

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.all(16),
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
                    mainAppState.profiles[post["profileID"]],
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${mainAppState.activities[post["activityID"]]["activity"]}: ${post["value"]} ${mainAppState.activities[post["activityID"]]["unit"]}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(onPressed: likeUpdate, child: Like(postIndex: postIndex))
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
