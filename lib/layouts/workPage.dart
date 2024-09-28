// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hackyeah/appState/mainAppState.dart';
import 'package:provider/provider.dart';


class WorkPage extends StatefulWidget {
  const WorkPage({
    super.key,
  });

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
      title: Text(
          'Health Work Session: ${appState.completedSessions}',
          ),
      
    ),
    body: SafeArea(
      child: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < appState.checkboxes.length; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: appState.getCheckboxState(i), 
                    onChanged: (bool? newValue) {
                      appState.changeCheckboxState(i); //zmienia stan checkboxa
                      setState(() {}); // odświeża UI 
                    }
                  ),
                  Text(appState.getCheckboxContent(i)),
                ],
              ),
            
            Text(
              formatTime(appState.remainingTime), // Wyświetlanie czasu
              style: const TextStyle(fontSize: 52,),
            ),
            // Pole do wpisania czasu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: _timeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Set Timer (minutes)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                final int? inputTime = int.tryParse(_timeController.text);
                if (inputTime != null) {
                  appState.setTimer(inputTime); // Zakładając, że masz taką metodę w MainAppState
                }
              },
              child: const Text("Set Timer"),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: appState.isRunning ? null : () => appState.startTimer(),
                  child: const Icon(Icons.play_arrow),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: appState.isRunning ? () => appState.stopTimer() : null,
                  child: const Icon(Icons.stop),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () => appState.resetTimer(),
                  child: const Icon(Icons.restart_alt),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
}