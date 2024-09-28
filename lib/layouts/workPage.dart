// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hackyeah/appState/mainAppState.dart';
import 'package:provider/provider.dart';


class WorkPage extends StatelessWidget {
  const WorkPage({
    super.key,
  });

  @override
Widget build(BuildContext context) {
  final appState = Provider.of<MainAppState>(context);

  // Konwersja sekund na format minut:sekundy
  String formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        formatTime(appState.remainingTime), // Wyświetlanie czasu
        style: const TextStyle(fontSize: 52),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: appState.isRunning ? null : () => appState.startTimer(),
            child: const Icon(Icons.play_arrow),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: appState.isRunning ? () => appState.stopTimer() : null,
            child: const Icon(Icons.stop),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => appState.resetTimer(),
            child: const Icon(Icons.restart_alt),
          ),
        ],
      ),
    ],
  );
}
}