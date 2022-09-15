import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health/model/workout.dart';

class CaloriesScreen extends StatelessWidget {
  const CaloriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: const Color(0xFF061941),
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Calories",
          style: TextStyle(
            color: Color(0xFF061941),
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "540",
                      style: TextStyle(
                        color: Color(0xFF5142AB),
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                      ),
                    ),
                    Text(
                      "calories burned",
                      style: TextStyle(
                        color: Color(0xFFCFB9E4),
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              Image.asset("assets/images/calories_lines_2x.png"),
              const SizedBox(height: 50.0),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Workouts",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            style: const ButtonStyle(
                                alignment: Alignment.bottomCenter),
                            onPressed: () => {},
                            child: const Text(
                              "Show All",
                              style: TextStyle(
                                color: Color(0xFF9874C9),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: CaloriesListWidget())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CaloriesListWidget extends StatefulWidget {
  const CaloriesListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CaloriesListWidgetState();
}

class _CaloriesListWidgetState extends State<CaloriesListWidget> {
  Future<List<Workout>> _getWorkouts() async {
    final encodedJson =
        await rootBundle.loadString("assets/data/workouts.json");
    final workouts = jsonDecode(encodedJson) as List<dynamic>;
    return workouts.map((workout) => Workout.fromJson(workout)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Workout>>(
        future: _getWorkouts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data;

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(
                data!.length,
                (index) => Column(
                  children: [
                    CalorieResultItem(workout: data[index]),
                    if (index < data.length - 1) ...[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Divider(height: 0.0),
                      ),
                    ]
                  ],
                ),
              ).toList(),
            ),
          );
        });
  }
}

class CalorieResultItem extends StatelessWidget {
  final Workout workout;

  const CalorieResultItem({Key? key, required this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: ExpansionTile(
        iconColor: const Color(0xFF9DA4B4),
        collapsedIconColor: const Color(0xFF9DA4B4),
        tilePadding:
            const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        childrenPadding:
            const EdgeInsets.symmetric(horizontal: 36.0, vertical: 12.0),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF0F8),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Image.asset("assets/images/walk.png"),
                ),
                const SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      workout.type,
                      style: const TextStyle(
                        color: Color(0xFF53668E),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3.0),
                    Row(
                      children: [
                        Text(
                          workout.range.toString(),
                          style: const TextStyle(
                            color: Color(0xFF53668E),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 3.0),
                        const Text(
                          "km",
                          style: TextStyle(
                            color: Color(0xFF53668E),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ShaderMask(
                  shaderCallback: (size) => const LinearGradient(
                    colors: [
                      Color(0xFF5142AB),
                      Color(0xFFA274CD),
                    ],
                  ).createShader(
                    Rect.fromLTWH(0, 0, size.width, size.height),
                  ),
                  child: Text(
                    workout.kcal.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 3.0),
                const Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    "kcal",
                    style: TextStyle(
                      color: Color(0xFF5142AB),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: {
              "Duration": workout.duration,
              "Total steps": workout.totalSteps,
              "Avg heart rate": workout.avgHeartRate
            }
                .entries
                .map((entry) => Column(
                      children: [
                        Text(
                          entry.key,
                          style: const TextStyle(color: Color(0xFFC5CAD3)),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          entry.value.toString(),
                          style: const TextStyle(
                              color: Color(0xFF53668E),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
