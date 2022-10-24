import '../../domain/entities/zodiac_entity.dart';

class ZodiacModel extends ZodiacEntity {
  ZodiacModel({
    required super.dateRange,
    required super.currentDate,
    required super.description,
    required super.compatibility,
    required super.mood,
    required super.color,
    required super.luckyNumber,
    required super.luckyTime,
  });

  factory ZodiacModel.fromJson(Map<String, dynamic> json) {
    return ZodiacModel(
      dateRange: json['date_range'],
      currentDate: json['current_date'],
      description: json['description'],
      compatibility: json['compatibility'],
      mood: json['mood'],
      color: json['color'],
      luckyNumber: json['lucky_number'],
      luckyTime: json['lucky_time'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date_range'] = dateRange;
    data['current_date'] = currentDate;
    data['description'] = description;
    data['compatibility'] = compatibility;
    data['mood'] = mood;
    data['color'] = color;
    data['lucky_number'] = luckyNumber;
    data['lucky_time'] = luckyTime;
    return data;
  }
}
