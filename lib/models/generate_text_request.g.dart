// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_text_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateTextRequest _$GenerateTextRequestFromJson(Map<String, dynamic> json) =>
    GenerateTextRequest(
      prompt: json['prompt'] as String,
      systemPrompt: json['system_prompt'] as String,
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0.7,
    );

Map<String, dynamic> _$GenerateTextRequestToJson(
  GenerateTextRequest instance,
) => <String, dynamic>{
  'prompt': instance.prompt,
  'system_prompt': instance.systemPrompt,
  'temperature': instance.temperature,
};
