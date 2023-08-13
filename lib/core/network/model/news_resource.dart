import 'package:freezed_annotation/freezed_annotation.dart';

import 'news_resource_type.dart';

part 'news_resource.g.dart';

part 'news_resource.freezed.dart';

@freezed
class NewsResourceDto with _$NewsResourceDto {

  factory NewsResourceDto(
      {@Default("") String id,
        @Default("") String title,
        @Default("") String content,
        @Default("") String url,
        @Default("") String headerImageUrl,
        @Default(NewsResourceType.unknown) NewsResourceType type,
        DateTime? publishDate,
        @Default([]) List<String> topics}) = _NewsResourceDto;

  factory NewsResourceDto.fromJson(Map<String, dynamic> json) =>
      _$NewsResourceDtoFromJson(json);
}
