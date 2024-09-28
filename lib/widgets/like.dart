import 'package:flutter/material.dart';
import 'package:hackyeah/appState/mainAppState.dart';
import 'package:provider/provider.dart';

class Like extends StatelessWidget {
  final postIndex;

  const Like({
    super.key,
    required this.postIndex
  });

  @override
  Widget build(BuildContext context) {

    var mainAppState = context.watch<MainAppState>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [Icon(Icons.add), Text(mainAppState.posts[postIndex]["likes"].toString())],
    );
  }
}
