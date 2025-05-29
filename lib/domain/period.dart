enum Period {
  day,
  week,
  month,
  newItems; 
}

extension PeriodExtension on Period {
  String get name {
    switch (this) {
      case Period.day:
        return 'day';
      case Period.week:
        return 'week';
      case Period.month:
        return 'month';
      case Period.newItems:
        return 'new';
    }
  }
}