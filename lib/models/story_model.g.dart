// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) => StoryModel(
  id: json['id'] as String,
  title: json['title'] as String,
  content: json['content'] as String,
  image: json['image'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  categories:
      (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$StoryModelToJson(StoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'image': instance.image,
      'createdAt': instance.createdAt.toIso8601String(),
      'categories': instance.categories.map((e) => e.toJson()).toList(),
    };
