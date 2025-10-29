// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryTemplate _$StoryTemplateFromJson(Map<String, dynamic> json) =>
    StoryTemplate(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      template: json['template'] as String,
      letterType: $enumDecode(_$LetterTypeEnumMap, json['letterType']),
      placeholders: (json['placeholders'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isPopular: json['isPopular'] as bool? ?? false,
      category: json['category'] as String?,
      gestationWeekRange: json['gestationWeekRange'] as String?,
    );

Map<String, dynamic> _$StoryTemplateToJson(StoryTemplate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'template': instance.template,
      'letterType': _$LetterTypeEnumMap[instance.letterType]!,
      'placeholders': instance.placeholders,
      'isPopular': instance.isPopular,
      'category': instance.category,
      'gestationWeekRange': instance.gestationWeekRange,
    };

const _$LetterTypeEnumMap = {
  LetterType.farewell: 'farewell',
  LetterType.love: 'love',
  LetterType.memory: 'memory',
  LetterType.hope: 'hope',
  LetterType.gratitude: 'gratitude',
  LetterType.custom: 'custom',
};
