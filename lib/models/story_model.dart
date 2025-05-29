import 'package:json_annotation/json_annotation.dart';
import 'package:stories_data/models/category_model.dart';

part 'story_model.g.dart';

@JsonSerializable(explicitToJson: true)
class StoryModel {
  final String id;
  final String title;
  final String description;
  final String content;
  final String image;
  final DateTime createdAt;
  final int readCount;
  final List<CategoryModel> categories;

  StoryModel({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.image,
    required this.createdAt,
    required this.readCount,
    required this.categories,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryModelToJson(this);
}