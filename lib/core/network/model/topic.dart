
import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic.freezed.dart';
part 'topic.g.dart';

@freezed
class TopicDto with _$TopicDto {

  factory TopicDto(
      {@Default("") String id,
        @Default("") String name,
        @Default("") String shortDescription ,
        @Default("") String longDescription ,
        @Default("") String url ,
        @Default("") String imageUrl ,
        @Default(false) bool followed }) = _TopicDto;

  factory TopicDto.fromJson(Map<String, dynamic> json) =>
      _$TopicDtoFromJson(json);
}
