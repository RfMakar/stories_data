// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryTypeModel _$CategoryTypeModelFromJson(Map<String, dynamic> json) =>
    CategoryTypeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$CategoryTypeModelToJson(CategoryTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categories': instance.categories,
    };
