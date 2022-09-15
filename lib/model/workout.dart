class Workout {
  final String type;
  final double range;
  final int kcal;
  final String duration;
  final int totalSteps;
  final int avgHeartRate;

  const Workout({
    required this.type,
    required this.range,
    required this.kcal,
    required this.duration,
    required this.totalSteps,
    required this.avgHeartRate,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      type: json["type"],
      range: json["range"],
      kcal: json["kcal"],
      duration: json["duration"],
      totalSteps: json["totalSteps"],
      avgHeartRate: json["avgHeartRate"],
    );
  }
}
