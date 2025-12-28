class ReadsStatsModel {
  final int total;
  final int today;
  final int week;
  final int month;

  ReadsStatsModel({
    required this.total,
    required this.today,
    required this.week,
    required this.month,
  });

  factory ReadsStatsModel.fromJson(Map<String, dynamic> json) {
    return ReadsStatsModel(
      total: json['total'] as int,
      today: json['today'] as int,
      week: json['week'] as int,
      month: json['month'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'today': today,
      'week': week,
      'month': month,
    };
  }
}
