// ignore: file_names


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

    return Scaffold(
      appBar: _buildAppBar(appState),
      body:
      Container(
        decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/logo_calendar.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.1),
                BlendMode.dstATop,),),),
                child:
      SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCheckboxList(appState),
              const SizedBox(height: 20),
              _buildRemainingTime(appState),
              const SizedBox(height: 15),
              _buildTimerInput(),
              const SizedBox(height: 15),
              _buildControlButtons(appState),
              const SizedBox(height: 15),
              _buildResetButton2(appState),
              const SizedBox(height: 15),
              _buildSessionIcons(appState),
            ],
          ),
        ),
      ),
    ));
  }

  AppBar _buildAppBar(MainAppState appState) {
    
    return AppBar(
      title: 
           Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Health Work Session: ${appState.completedSessions}', style: TextStyle(
            fontFamily: 'Now',
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Theme.of(context).colorScheme.primary,
                    )),
          ),
        );
    // return AppBar(
    //   ,
    // );
  }

  Widget _buildCheckboxList(MainAppState appState) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(appState.checkboxes.length, (index) {
        return _buildCheckbox(appState, index);
      }),
    );
  }

  Widget _buildCheckbox(MainAppState appState, int index) {
    return Column(
      children: [
        Checkbox(
          value: appState.getCheckboxState(index),
          onChanged: (bool? newValue) {
            appState.changeCheckboxState(index);
            setState(() {});
          },
        ),
        Text(appState.getCheckboxContent(index)),
      ],
    );
  }

  Widget _buildRemainingTime(MainAppState appState) {
    return Column(
      children: [
        Text('Remaining ${appState.currentState}:'),
        Text(
          _formatTime(appState.remainingTime),
          style: const TextStyle(fontSize: 52),
        ),
      ],
    );
  }

  String _formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  Widget _buildTimerInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: _timeController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Set Timer (minutes)',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildControlButtons(MainAppState appState) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildSetTimerButton(appState),
      const SizedBox(height: 15), 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildStartButton(appState),
          const SizedBox(width: 15),
          _buildStopButton(appState),
          const SizedBox(width: 15),
          _buildResetButton1(appState),// Add this new button
        ],
      ),
    ],
  );
}

  Widget _buildSetTimerButton(MainAppState appState) {
  return ElevatedButton(
    onPressed: () {
      // Get the input from the controller
      final String? input = _timeController.text;
      if (input != null && input.isNotEmpty) {
        // Parse it to an integer
        final int? timerValue = int.tryParse(input);
        if (timerValue != null) {
          // Use the appState method to set the timer
          appState.setTimer(timerValue);
        }
      }
    },
    child: const Text('Set Timer'),
  );
}

  Widget _buildStartButton(MainAppState appState) {
    return Tooltip(
      message: 'Start Timer',
      child: ElevatedButton(
        onPressed: appState.isRunning ? null : appState.startSession,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  Widget _buildStopButton(MainAppState appState) {
    return Tooltip(
      message: 'Stop Timer',
      child: ElevatedButton(
        onPressed: appState.isRunning ? appState.stopTimer : null,
        child: const Icon(Icons.stop),
      ),
    );
  }

  Widget _buildResetButton1(MainAppState appState) {
    return Tooltip(
      message: 'Reset Timer',
      child: ElevatedButton(
        onPressed: appState.resetTimer,
        child: const Icon(Icons.restart_alt),
      ),
    );
  }

  Widget _buildResetButton2(MainAppState appState) {
    return Tooltip(
      message: 'Reset Session Counter',
      child: ElevatedButton(
        onPressed: appState.resetSessions,
        child: const Icon(Icons.self_improvement),
      ),
    );
  }

  Widget _buildSessionIcons(MainAppState appState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(appState.completedSessions, (index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Icon(Icons.check_circle, color: Colors.green),
        );
      }),
    );
  }
}
