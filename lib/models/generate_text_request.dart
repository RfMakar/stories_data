import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generate_text_request.g.dart';

@JsonSerializable()
class GenerateTextRequest extends Equatable {
  final String prompt;

  @JsonKey(name: 'system_prompt')
  final String systemPrompt;

  final double temperature;

  const GenerateTextRequest({
    required this.prompt,
    required this.systemPrompt,
    this.temperature = 0.7,
  });

  factory GenerateTextRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateTextRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateTextRequestToJson(this);

  @override
  List<Object?> get props => [prompt, systemPrompt, temperature];
}