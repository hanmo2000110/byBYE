// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'letter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Letter _$LetterFromJson(Map<String, dynamic> json) => Letter(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      type: $enumDecode(_$LetterTypeEnumMap, json['type']),
      babyName: json['babyName'] as String?,
      gestationWeeks: (json['gestationWeeks'] as num?)?.toInt(),
      dateWritten: json['dateWritten'] == null
          ? null
          : DateTime.parse(json['dateWritten'] as String),
      isTemplate: json['isTemplate'] as bool? ?? false,
      isFavorite: json['isFavorite'] as bool? ?? false,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$LetterToJson(Letter instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'type': _$LetterTypeEnumMap[instance.type]!,
      'babyName': instance.babyName,
      'gestationWeeks': instance.gestationWeeks,
      'dateWritten': instance.dateWritten?.toIso8601String(),
      'isTemplate': instance.isTemplate,
      'isFavorite': instance.isFavorite,
      'tags': instance.tags,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$LetterTypeEnumMap = {
  LetterType.farewell: 'farewell',
  LetterType.love: 'love',
  LetterType.memory: 'memory',
  LetterType.hope: 'hope',
  LetterType.gratitude: 'gratitude',
  LetterType.custom: 'custom',
};
