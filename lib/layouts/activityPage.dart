// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../appState/mainAppState.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
import 'package:hackyeah/widgets/activityPopup.dart';
import 'package:dart_eval/dart_eval.dart';

//Notion
import 'package:hackyeah/notion/post.dart';
import 'package:hackyeah/notion/notion_repository.dart';
import 'package:hackyeah/notion/failure_model.dart';
import 'package:function_tree/function_tree.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({
    super.key,
  });

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  late Future<List<ActivityVar>> _futureActivity;

  @override
  void initState() {
    super.initState();
    _futureActivity = ActivityRepository().getItems();
  }

  Widget build(BuildContext context) {
    const title = 'Activities.';

    var mainAppState = context.watch<MainAppState>();

    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0),
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(title,
                style: TextStyle(
                  fontFamily: 'Now',
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Theme.of(context).colorScheme.primary,
                )),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("img/logo_clear.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.2),
                BlendMode.dstATop,
              ),
            ),
          ),
          child: FutureBuilder(
              future: _futureActivity,
              builder: (context, snapshots) {
                if (snapshots.hasData) {
                  final activity_list = snapshots.data!;
                  return activityWidget(activity_list: activity_list);
                } else if (snapshots.hasError) {
                  final failure = snapshots.error as Failure;
                  return Center(child: Text(failure.message));
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ));
  }
}

class activityWidget extends StatelessWidget {
  const activityWidget({
    super.key,
    required this.activity_list,
  });

  final List<ActivityVar> activity_list;
  IconData main() {
    return Icons.bike_scooter;
  }

  @override
  Widget build(BuildContext context) {
    var icons_list = [
      Icons.bike_scooter,
      Icons.landscape,
      Icons.flag,
      Icons.arrow_upward,
      Icons.directions_walk,
      Icons.nordic_walking,
    ];

    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(activity_list.length, (index) {
        return Center(
            child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  showPopupCard(
                    context: context,
                    builder: (context) {
                      return (activityCard(
                        activity_test_var: activity_list[index],
                        indexHandler: index,
                      ));
                    },
                    alignment: Alignment.center,
                    useSafeArea: true,
                    dimBackground: true,
                  );
                }, // Handle your callback
                child: Ink(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 4.0),
                    color: Color.fromRGBO(79, 81, 140, 1),
                  ),
                  child: Center(
                    child: Column(children: [
                      Icon(
                        icons_list[activity_list[index].activityIcon],
                        color: Theme.of(context).colorScheme.primary,
                        size: 80,
                      ),
                      Container(
                        child: Text(
                          activity_list[index].activityName,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ]),
                  ),
                )));
      }),
    );
  }
}
