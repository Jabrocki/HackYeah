import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            width: 200,
            child: Text("timer"),
          )
        ],
      ),
    );
  }
}