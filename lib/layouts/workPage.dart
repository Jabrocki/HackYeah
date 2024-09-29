// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hackyeah/appState/mainAppState.dart';
import 'package:provider/provider.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MainAppState>(context);

    // Konwersja sekund na format minut:sekundy
    String formatTime(int totalSeconds) {
      int minutes = totalSeconds ~/ 60;
      int seconds = totalSeconds % 60;
      return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Health Work Session: ${appState.completedSessions}'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0, l = appState.checkboxes.length; i < l; i++)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: appState.getCheckboxState(i),
                      onChanged: (bool? newValue) {
                        appState.changeCheckboxState(i); // Zmienia stan checkboxa
                        setState(() {}); // Odświeża UI 
                      },
                    ),
                    Text(appState.getCheckboxContent(i)),
                  ],
                ),
              const SizedBox(height: 20),
              Text('Remaining ${appState.currentState}:'),
              Text(
                formatTime(appState.remainingTime), // Wyświetlanie czasu
                style: const TextStyle(fontSize: 52),
              ),
              // Pole do wpisania czasu
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: _timeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Set Timer (seconds)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Tooltip(
                message: 'Click to set the timer',
                child: ElevatedButton(
                  onPressed: () {
                    final int? inputTime = int.tryParse(_timeController.text);
                    if (inputTime != null) {
                      appState.setTimer(inputTime);
                    }
                  },
                  child: const Text("Set timer"),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                    message: 'Start Timer',
                    child: ElevatedButton(
                      onPressed: appState.isRunning ? null : () => appState.startSession(),
                      child: const Icon(Icons.play_arrow),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Tooltip(
                    message: 'Stop Timer',
                    child: ElevatedButton(
                      onPressed: appState.isRunning ? () => appState.stopTimer() : null,
                      child: const Icon(Icons.stop),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Tooltip(

                    message: 'Reset Timer',
                    child: ElevatedButton(
                      onPressed: () => appState.resetTimer(),
                      child: const Icon(Icons.restart_alt),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Tooltip(
                message: 'Reset session counter',
                child: ElevatedButton(
                  onPressed: () => appState.resetSessions(), 
                  child: const Icon(Icons.self_improvement),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(appState.completedSessions, (index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Icon(Icons.check_circle, color: Colors.green),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
