import 'package:flutter/material.dart';
import 'package:hackyeah/appState/mainAppState.dart';
import 'package:provider/provider.dart';

class Like extends StatelessWidget {
  final int likeNumber;

  const Like({
    super.key,
    required this.likeNumber
  });

  @override
  Widget build(BuildContext context) {

    var mainAppState = context.watch<MainAppState>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [Icon(Icons.add), Text(likeNumber.toString())],
    );
  }
}
