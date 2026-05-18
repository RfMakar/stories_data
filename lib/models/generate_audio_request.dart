import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generate_audio_request.g.dart';

@JsonSerializable()
class GenerateAudioRequest extends Equatable {
  final String text;

  const GenerateAudioRequest({
    required this.text,
  });

  factory GenerateAudioRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateAudioRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateAudioRequestToJson(this);

  @override
  List<Object?> get props => [text];
}