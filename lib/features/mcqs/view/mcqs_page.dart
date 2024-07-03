import 'package:flutter/material.dart';
import 'package:memoneet_task/features/mcqs/data/mcqs_data.dart';
import 'package:memoneet_task/features/mcqs/provider/mcqs_provider.dart';
import 'package:memoneet_task/service/streak_manager.dart';
import 'package:provider/provider.dart';

import 'result_page.dart';

class McqsPage extends StatefulWidget {
  const McqsPage({super.key});

  @override
  State<McqsPage> createState() => _McqsPageState();
}

class _McqsPageState extends State<McqsPage> {
  List<int> playedMcqs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MCQS'),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.local_fire_department),
              Text(StreakManager().streak)
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(),
                  ));
            },
            icon: Icon(Icons.bar_chart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: mcqData.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mcqData[index].question,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FilledButton.icon(
                          onPressed: playedMcqs.contains(index)
                              ? null
                              : () {
                                  context.read<McqProvider>().addTrueCount();

                                  StreakManager().incrementStreak();
                                  playedMcqs.add(index);
                                  setState(() {});
                                },
                          label: const Text("Ture"),
                          icon: const Icon(Icons.check),
                        ),
                        FilledButton.icon(
                          onPressed: playedMcqs.contains(index)
                              ? null
                              : () {
                                  context.read<McqProvider>().addFalseCount();
                                  StreakManager().incrementStreak();
                                  playedMcqs.add(index);
                                  setState(() {});
                                },
                          label: const Text("False"),
                          icon: const Icon(Icons.close),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
