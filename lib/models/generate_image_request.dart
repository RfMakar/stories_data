import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generate_image_request.g.dart';

@JsonSerializable()
class GenerateImageRequest extends Equatable {
  final String prompt;

  const GenerateImageRequest({
    required this.prompt,
  });

  factory GenerateImageRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateImageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateImageRequestToJson(this);

  @override
  List<Object?> get props => [prompt];
}