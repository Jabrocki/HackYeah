// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';

class RidicFlexible extends StatelessWidget {
  final int test;
  const RidicFlexible({
    super.key,
    required this.test
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: test,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary, width: 4.0),
          color: Theme.of(context).colorScheme.surface,
        ),
        margin: const EdgeInsets.only(top: 30.0,left: 30, right: 30),
      ),
    );
  }
}