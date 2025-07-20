// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) => StoryModel(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  content: json['content'] as String,
  image: json['image'] as String,
  audio: json['audio'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  readCount: (json['readCount'] as num).toInt(),
  categories:
      (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$StoryModelToJson(StoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'image': instance.image,
      'audio': instance.audio,
      'createdAt': instance.createdAt.toIso8601String(),
      'readCount': instance.readCount,
      'categories': instance.categories.map((e) => e.toJson()).toList(),
    };
