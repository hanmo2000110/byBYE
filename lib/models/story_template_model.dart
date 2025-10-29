import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'letter_model.dart';

part 'story_template_model.g.dart';

@JsonSerializable()
class StoryTemplate extends Equatable {
  const StoryTemplate({
    required this.id,
    required this.title,
    required this.description,
    required this.template,
    required this.letterType,
    this.placeholders = const [],
    this.isPopular = false,
    this.category,
    this.gestationWeekRange,
  });

  final String id;
  final String title;
  final String description;
  final String template;
  final LetterType letterType;
  final List<String> placeholders;
  final bool isPopular;
  final String? category;
  final String? gestationWeekRange;

  factory StoryTemplate.fromJson(Map<String, dynamic> json) =>
      _$StoryTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$StoryTemplateToJson(this);

  StoryTemplate copyWith({
    String? id,
    String? title,
    String? description,
    String? template,
    LetterType? letterType,
    List<String>? placeholders,
    bool? isPopular,
    String? category,
    String? gestationWeekRange,
  }) {
    return StoryTemplate(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      template: template ?? this.template,
      letterType: letterType ?? this.letterType,
      placeholders: placeholders ?? this.placeholders,
      isPopular: isPopular ?? this.isPopular,
      category: category ?? this.category,
      gestationWeekRange: gestationWeekRange ?? this.gestationWeekRange,
    );
  }

  String generateContent(Map<String, String> replacements) {
    String content = template;

    for (final placeholder in placeholders) {
      final replacement = replacements[placeholder] ?? '[$placeholder]';
      content = content.replaceAll('{$placeholder}', replacement);
    }

    return content;
  }

  bool get hasPlaceholders => placeholders.isNotEmpty;

  List<String> get missingPlaceholders {
    final regex = RegExp(r'\{([^}]+)\}');
    final matches = regex.allMatches(template);
    final foundPlaceholders = matches.map((m) => m.group(1)!).toSet();

    return foundPlaceholders.where((p) => !placeholders.contains(p)).toList();
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        template,
        letterType,
        placeholders,
        isPopular,
        category,
        gestationWeekRange,
      ];

  @override
  String toString() {
    return 'StoryTemplate(id: $id, title: $title, letterType: $letterType)';
  }
}