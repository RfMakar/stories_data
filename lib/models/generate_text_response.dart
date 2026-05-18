import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generate_text_response.g.dart';

@JsonSerializable()
class GenerateTextResponse extends Equatable {
  final String text;

  const GenerateTextResponse({
    required this.text,
  });

  factory GenerateTextResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateTextResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateTextResponseToJson(this);

  @override
  List<Object?> get props => [text];
}