import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum NewsResourceType {
  @JsonValue("Video 📺")
  video(
    displayText: "Video 📺",
    description: "A video published on YouTube",
  ),
  @JsonValue("API change")
  apiChange(
    displayText: "API change",
    description:
        "An addition, deprecation or change to the Android platform APIs.",
  ),
  @JsonValue("Jetpack release 🚀")
  jetpackRelease(
    displayText: "Jetpack release 🚀",
    description: "Release of Jetpack.",
  ),
  @JsonValue("Article 📚")
  article(
    displayText: "Article 📚",
    description: "An article, typically on Medium or the official Android blog",
  ),
  @JsonValue("Codelab")
  codelab(
    displayText: "Codelab",
    description: "A new or updated codelab",
  ),
  @JsonValue("Podcast 🎙")
  podcast(
    displayText: "Podcast 🎙",
    description: "A podcast",
  ),
  @JsonValue("Docs 📑")
  docs(
    displayText: "Docs 📑",
    description: "A new or updated piece of documentation",
  ),
  @JsonValue("Event 📆")
  event(
    displayText: "Event 📆",
    description:
        "Information about a developer event e.g. Android Developer Summit",
  ),
  @JsonValue("DAC - Android version features")
  dac(
    displayText: "DAC",
    description:
        "Android version features - Information about features in an Android",
  ),
  @JsonValue("")
  unknown(
    displayText: "Unknown",
    description: "Unknown",
  );

  const NewsResourceType({
    required this.displayText,
    required this.description,
  });

  final String displayText;
  final String description;
}
